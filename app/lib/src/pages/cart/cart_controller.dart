import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/cart/components/cart_item_widget.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'cart_binding.dart';

part 'cart_page.dart';

class CartController extends GetxController {
  final GetCartDetailUseCase _getCartDetailUseCase;
  final GetDocumentUseCase _getDocumentUseCase;
  final DeleteCartUseCase _deleteCartUseCase;
  final DeleteCartItemUseCase _deleteCartItemUseCase;

  CartController(
    this._getCartDetailUseCase,
    this._getDocumentUseCase,
    this._deleteCartUseCase,
    this._deleteCartItemUseCase,
  );

  Rxn<CartModel> cart = Rxn<CartModel>();

  Future<void> getCart(String cartId) async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getCartDetailUseCase.executeObject(
        param: GetCartDetailParam(cartId: cartId),
      );

      if (result.netData != null) {
        cart.value = result.netData;
      }

      AppLoadingOverlayWidget.dismiss();

      if (cart.value != null) {
        for (var cartItem in cart.value!.cartItems) {
          cartItem.product.coverImageData = await AppImageExt.getImage(
            _getDocumentUseCase,
            cartItem.product.coverImage,
          );
        }
      }

      cart.refresh();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  double totalPrice(CartModel cart) {
    return cart.cartItems.fold(
      0,
      (previousValue, element) => previousValue + element.finalPrice,
    );
  }

  Future<void> deleteCart(String cartId) async {
    await _deleteCartUseCase.executeObject(
      param: DeleteCartParam(
        cartId: cartId,
      ),
    );

    Get.back();
  }

  Future<void> deleteCartItem(String cartItemId) async {
    await _deleteCartItemUseCase.executeObject(
      param: DeleteCartItemParam(
        cartItemId: cartItemId,
      ),
    );

    await getCart(cart.value!.id);
  }
}
