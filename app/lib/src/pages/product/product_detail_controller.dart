import 'dart:math';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/product/components/checkbox_button_group.dart';
import 'package:app/src/pages/product/components/radio_button_group_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './product_detail_page.dart';
part './product_detail_binding.dart';

class ProductDetailKey {
  static String note = 'note';
  static String productId = 'productId';
  static String cartItemId = 'cartItemId';
  static String quantity = 'quantity';
  static String addons = 'addons';
}

class ProductDetailController extends GetxController {
  var formKey = GlobalKey<FormBuilderState>().obs;

  final GetProductDetailUseCase _getProductDetailUseCase;
  final GetDocumentUseCase _getDocumentUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;

  ProductDetailController(
    this._getProductDetailUseCase,
    this._getDocumentUseCase,
    this._addToCartUseCase,
    this._updateCartItemUseCase,
  );

  Rxn<ProductModel> product = Rxn<ProductModel>();
  Rxn<int> quantity = Rxn<int>(1);
  Rx<Map<String, dynamic>> formInitialValue = Rx<Map<String, dynamic>>({});

  Future<void> initialize() {
    if (isUpdating()) {
      quantity.value = Get.arguments[ProductDetailKey.quantity];

      formInitialValue.value[ProductDetailKey.note] =
          Get.arguments[ProductDetailKey.note];

      final argumentAddons =
          Get.arguments[ProductDetailKey.addons] as List<ProductAddonModel>;

      for (ProductOptionSectionModel section
          in product.value?.productOptionSections ?? []) {
        if (section.maxAllowedChoices > 1) {
          List<String> chosenIds = [];

          for (ProductAddonModel addon in section.productAddons) {
            String? chosenId = argumentAddons
                .firstWhereOrNull((element) => element.id == addon.id)
                ?.id;

            if (chosenId != null) {
              chosenIds.add(chosenId);
            }
          }

          formInitialValue.value[section.id] = chosenIds;
        } else {
          for (ProductAddonModel addon in section.productAddons) {
            String? chosenId = argumentAddons
                .firstWhereOrNull((element) => element.id == addon.id)
                ?.id;

            if (chosenId != null) {
              formInitialValue.value[section.id] = chosenId;
            }

            break;
          }
        }
      }

      formInitialValue.refresh();
    }

    return Future.value();
  }

  Future<void> getProductDetail(String productId) async {
    try {
      AppLoadingOverlayWidget.show();
      final result = await _getProductDetailUseCase.executeObject(
        param: GetProductDetailParam(
          productId: productId,
        ),
      );

      if (result.netData != null) {
        final productData = result.netData;

        product.value = productData;

        if (isUpdating()) {
          await initialize();
        }

        AppLoadingOverlayWidget.dismiss();

        product.value?.coverImageData =
            await getImage(product.value?.coverImage);

        product.refresh();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  bool isUpdating() {
    return Get.arguments is! String;
  }

  String? validateProductOptions() {
    String? errorString;

    for (ProductOptionSectionModel section
        in product.value?.productOptionSections ?? []) {
      final options = formKey.value.currentState?.fields[section.id]?.value;

      if (section.isRequired && options == null) {
        errorString = '${R.strings.pleaseSelect} 1 ${section.name}';
      }
      if (options is List<String> &&
          options.length > section.maxAllowedChoices) {
        errorString =
            '${R.strings.pleaseSelectMaximum} ${section.maxAllowedChoices} ${section.name}';
      }

      if (errorString != null) return errorString;
    }

    return errorString;
  }

  void increaseProductQuantity() {
    final currentQuantity = quantity.value ?? 0;
    quantity.value = currentQuantity + 1;
    quantity.refresh();
  }

  void decreaseProductQuantity() {
    final currentQuantity = quantity.value ?? 0;
    if (currentQuantity > 0) {
      quantity.value = currentQuantity - 1;
    }
    quantity.refresh();
  }

  Future<String?> getImage(String? imageId) async {
    if (imageId == null) return null;

    final splitId = imageId.split('|').last;

    final response = await _getDocumentUseCase.executeObject(
      param: GetDocumentParam(
        documentId: splitId,
      ),
    );

    return Future.value(response.netData!.content);
  }

  Future<void> addToCart() async {
    try {
      if (formKey.value.currentState == null) return;

      formKey.value.currentState?.save();

      final validateProductOptionsResult = validateProductOptions();

      if (validateProductOptionsResult != null) {
        AppDefaultDialogWidget()
            .setContent(validateProductOptionsResult)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.confirm)
            .setNegativeText(R.strings.close)
            .buildDialog(Get.context!)
            .show();
        return;
      }

      AppLoadingOverlayWidget.show();

      List<String> addons = [];

      product.value?.productOptionSections?.forEach((section) {
        if (section.maxAllowedChoices > 1) {
          final values = formKey.value.currentState!.fields[section.id]!.value;
          if (values is List<String>) {
            addons.addAll(values);
          }
        } else {
          addons.add(formKey.value.currentState!.fields[section.id]!.value);
        }
      });

      final result = await _addToCartUseCase.executeObject(
        param: AddToCartParam(
          productId: product.value!.id!,
          addons: addons,
          quantity: quantity.value ?? 0,
          note:
              formKey.value.currentState!.fields[ProductDetailKey.note]?.value ?? '',
        ),
      );

      if (result.netData != null) {
        AppLoadingOverlayWidget.dismiss();
        Get.back(result: true);
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> updateCartItem() async {
    try {
      if (formKey.value.currentState == null) return;

      formKey.value.currentState?.save();

      final validateProductOptionsResult = validateProductOptions();

      if (validateProductOptionsResult != null) {
        AppDefaultDialogWidget()
            .setContent(validateProductOptionsResult)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.confirm)
            .setNegativeText(R.strings.close)
            .buildDialog(Get.context!)
            .show();
        return;
      }

      AppLoadingOverlayWidget.show();

      List<String> addons = [];

      product.value?.productOptionSections?.forEach((section) {
        if (section.maxAllowedChoices > 1) {
          final values = formKey.value.currentState!.fields[section.id]!.value;
          if (values is List<String>) {
            addons.addAll(values);
          }
        } else {
          addons.add(formKey.value.currentState!.fields[section.id]!.value);
        }
      });

      final result = await _updateCartItemUseCase.executeObject(
        param: UpdateCartItemParam(
          cartItemId: Get.arguments[ProductDetailKey.cartItemId],
          addons: addons,
          quantity: quantity.value ?? 0,
          note:
              formKey.value.currentState!.fields[ProductDetailKey.note]?.value ?? '',
        ),
      );

      if (result.netData != null) {
        AppLoadingOverlayWidget.dismiss();
        Get.back(result: true);
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
