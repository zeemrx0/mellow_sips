import 'dart:math';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
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

  ProductDetailController(
    this._getProductDetailUseCase,
    this._getDocumentUseCase,
  );

  Rxn<ProductModel> product = Rxn<ProductModel>();
  Rxn<int> quantity = Rxn<int>(1);

  Rx<Map<String, bool>> isAddonChecked = Rx<Map<String, bool>>({});

  Future<void> getProductDetail(String productId) async {
    try {
      AppLoadingOverlayWidget.show();
      final result = await _getProductDetailUseCase.executeObject(
          param: GetProductDetailParam(
        productId: productId,
      ));

      if (result.netData != null) {
        final productData = result.netData;

        product.value = productData;

        AppLoadingOverlayWidget.dismiss();

        product.value?.coverImageData =
            await getImage(product.value?.coverImage);

        product.refresh();
      }
    } catch (e) {
      AppLoadingOverlayWidget.dismiss();
      print(e);
    }
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
}
