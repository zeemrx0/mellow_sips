import 'dart:convert';
import 'dart:math';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/product/components/quantity_addon_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './product_detail_page.dart';
part './product_detail_binding.dart';

class ProductDetailKey {
  static String note = 'note';
}

class ProductDetailController extends GetxController {
  final GetProductDetailUseCase _getProductDetailUseCase;
  final GetDocumentUseCase _getDocumentUseCase;
  final AddToCartUseCase _addToCartUseCase;

  ProductDetailController(
    this._getProductDetailUseCase,
    this._getDocumentUseCase,
    this._addToCartUseCase,
  );

  Rxn<ProductModel> product = Rxn<ProductModel>();
  Rxn<int> quantity = Rxn<int>(1);

  Rx<Map<String, int>> addonQuantity = Rx<Map<String, int>>({});

  Rx<String> note = Rx<String>('');

  Future<void> getProductDetail(String productId) async {
    try {
      AppLoadingOverlayWidget.show();
      final result = await _getProductDetailUseCase.executeObject(
          param: GetProductDetailParam(
        productId: productId,
      ));

      if (result.netData != null) {
        final productData = result.netData;
        productData!.coverImage = await getImage(productData.coverImage);

        product.value = productData;
      }
      AppLoadingOverlayWidget.dismiss();
    } catch (e) {
      AppLoadingOverlayWidget.dismiss();
      print(e);
    }
  }

  void increaseAddonQuantity(String addonId) {
    final currentQuantity = addonQuantity.value[addonId] ?? 0;
    addonQuantity.value[addonId] = currentQuantity + 1;
    addonQuantity.refresh();
  }

  void deceaseAddonQuantity(String addonId) {
    final currentQuantity = addonQuantity.value[addonId] ?? 0;
    if (currentQuantity > 0) {
      addonQuantity.value[addonId] = currentQuantity - 1;
    }
    addonQuantity.refresh();
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
      AppLoadingOverlayWidget.show();

      final result = await _addToCartUseCase.executeObject(
        param: AddToCartParam(
          productId: product.value!.id!,
          addons: addonQuantity.value.keys.toList(),
          quantity: quantity.value ?? 0,
          note: note.value,
        ),
      );

      if (result.netData != null) {
        Get.back();
      }

      AppLoadingOverlayWidget.dismiss();
    } catch (e) {
      AppLoadingOverlayWidget.dismiss();
      print(e);
    }
  }
}
