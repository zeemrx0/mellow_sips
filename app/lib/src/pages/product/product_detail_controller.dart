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
import 'package:utilities/utilities.dart';

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
  final DeleteCartItemUseCase _deleteCartItemUseCase;

  ProductDetailController(
    this._getProductDetailUseCase,
    this._getDocumentUseCase,
    this._addToCartUseCase,
    this._updateCartItemUseCase,
    this._deleteCartItemUseCase,
  );

  Rxn<ProductModel> product = Rxn<ProductModel>();
  Rx<int> quantity = Rx<int>(1);
  Rx<Map<String, dynamic>> formInitialValue = Rx<Map<String, dynamic>>({});
  Rx<int> price = Rx<int>(0);

  Future<void> initialize() {
    if (isEditing()) {
      quantity.value = Get.arguments[ProductDetailKey.quantity];

      formInitialValue.value[ProductDetailKey.note] =
          Get.arguments[ProductDetailKey.note];

      final argumentAddons =
          Get.arguments[ProductDetailKey.addons] as List<ProductAddonModel>? ??
              [];

      for (ProductOptionSectionModel section
          in product.value?.productOptionSections ?? []) {
        if (section.maxAllowedChoices > 1) {
          List<String> chosenIds = [];

          for (ProductAddonModel addon in section.productAddons ?? []) {
            String? chosenId = argumentAddons
                .firstWhereOrNull((element) => element.id == addon.id)
                ?.id;

            if (chosenId != null) {
              chosenIds.add(chosenId);
            }
          }

          formInitialValue.value[section.id] = chosenIds;
        } else {
          for (ProductAddonModel addon in section.productAddons ?? []) {
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

        if (isEditing()) {
          await initialize();
        }

        AppLoadingOverlayWidget.dismiss();

        product.value?.coverImageData = await AppImageExt.getImage(
          _getDocumentUseCase,
          product.value?.coverImage,
        );

        price.value = product.value?.price ?? 0;

        product.refresh();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  void calculatePrice() {
    int total = (product.value?.price ?? 0);

    for (ProductOptionSectionModel section
        in product.value?.productOptionSections ?? []) {
      final options = formKey.value.currentState?.fields[section.id]?.value;

      if (options is String?) {
        if (options != null && options.isNotEmpty) {
          total += section.productAddons
                  ?.firstWhereOrNull((element) => element.id == options)
                  ?.price ??
              0;
        }
      }

      if (options is List<String>?) {
        if (options != null && options.isNotEmpty) {
          for (String option in options) {
            total += section.productAddons
                    ?.firstWhereOrNull((element) => element.id == option)
                    ?.price ??
                0;
          }
        }
      }
    }

    price.value = total * quantity.value;
    price.refresh();
  }

  bool isEditing() {
    bool? isEditing = Get.arguments[AppConstants.isEditing] as bool?;
    return isEditing == true;
  }

  String? validateProductOptions() {
    String? errorString;

    for (ProductOptionSectionModel section
        in product.value?.productOptionSections ?? []) {
      final options = formKey.value.currentState?.fields[section.id]?.value;

      if (options is String?) {
        if (options == null || options.isEmpty) {
          errorString = '${R.strings.pleaseSelect} ${section.name}';
        }
      }

      if (options is List<String>?) {
        if (options == null || options.isEmpty) {
          errorString = '${R.strings.pleaseSelect} ${section.name}';
        } else if (options.length > section.maxAllowedChoices) {
          errorString =
              '${R.strings.pleaseSelectMaximum} ${section.maxAllowedChoices} ${section.name}';
        }
      }

      if (errorString != null) return errorString;
    }

    return errorString;
  }

  void increaseProductQuantity() {
    final currentQuantity = quantity.value;
    quantity.value = currentQuantity + 1;
    calculatePrice();
    quantity.refresh();
  }

  Future<void> decreaseProductQuantity() async {
    if (quantity.value == 1) {
      if (isEditing()) {
        AppDefaultDialogWidget()
            .setTitle(R.strings.removeProductFromCart)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.confirm)
            .setOnPositive(() async {
              await _deleteCartItemUseCase.executeObject(
                param: DeleteCartItemParam(
                  cartItemId: Get.arguments[ProductDetailKey.cartItemId],
                ),
              );

              Get.back();
            })
            .setNegativeText(R.strings.close)
            .buildDialog(Get.context!)
            .show();
      }

      return;
    }

    final currentQuantity = quantity.value;

    if (currentQuantity > 0) {
      quantity.value = currentQuantity - 1;
    }

    calculatePrice();

    quantity.refresh();
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
          quantity: quantity.value,
          note: formKey
                  .value.currentState!.fields[ProductDetailKey.note]?.value ??
              '',
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
          quantity: quantity.value,
          note: formKey
                  .value.currentState!.fields[ProductDetailKey.note]?.value ??
              '',
        ),
      );

      if (result.netData != null) {
        AppLoadingOverlayWidget.dismiss();
        Get.back();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
