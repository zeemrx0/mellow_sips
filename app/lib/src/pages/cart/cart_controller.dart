import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/cart/components/cart_item_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'cart_binding.dart';

part 'cart_page.dart';

class CartController extends GetxController {
  final GetAllCartUseCase _getAllCartUseCase;
  final GetCartDetailUseCase _getCartDetailUseCase;
  final GetDocumentUseCase _getDocumentUseCase;
  final DeleteCartUseCase _deleteCartUseCase;
  final DeleteCartItemUseCase _deleteCartItemUseCase;

  CartController(
    this._getAllCartUseCase,
    this._getCartDetailUseCase,
    this._getDocumentUseCase,
    this._deleteCartUseCase,
    this._deleteCartItemUseCase,
  );

  RxList<CartModel> carts = <CartModel>[].obs;

  Future<void> getAllCart() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getAllCartUseCase.executeList();

      if (result.netData != null) {
        carts.value = <CartModel>[];

        for (var cart in result.netData!) {
          final cartResult = await _getCartDetailUseCase.executeObject(
            param: GetCartDetailParam(cartId: cart.id),
          );

          if (cartResult.netData != null) {
            final cartData = cartResult.netData as CartModel;

            carts.add(cartData);
          }
        }
      }

      AppLoadingOverlayWidget.dismiss();

      for (var cart in carts) {
        for (var cartItem in cart.cartItems) {
          cartItem.product.coverImageData =
              await getImage(cartItem.product.coverImage);
        }

        carts.refresh();
      }
    } catch (e) {
      AppLoadingOverlayWidget.dismiss();
      print(e);
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

    await getAllCart();
    carts.refresh();
  }

  Future<void> deleteCartItem(String cartItemId) async {
    await _deleteCartItemUseCase.executeObject(
      param: DeleteCartItemParam(
        cartItemId: cartItemId,
      ),
    );

    await getAllCart();
    carts.refresh();
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
