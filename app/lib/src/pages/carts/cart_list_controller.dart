import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './cart_list_page.dart';
part './cart_list_binding.dart';

class CartListController extends GetxController {
  final GetAllCartUseCase _getAllCartUseCase;
  final GetDocumentUseCase _getDocumentUseCase;

  CartListController(
    this._getAllCartUseCase,
    this._getDocumentUseCase,
  );

  Rxn<List<CartModel>> carts = Rxn<List<CartModel>>();

  Future<void> getAllCart() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getAllCartUseCase.executeList();

      if (result.netData != null) {
        final cartsData = result.netData;

        for (final cart in cartsData ?? []) {
          cart.store.coverImageData = await AppImageExt.getImage(
            _getDocumentUseCase,
            cart.store.coverImage,
          );
        }

        carts.value = cartsData;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
