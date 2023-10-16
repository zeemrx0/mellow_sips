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

  CartController(this._getAllCartUseCase, this._getCartDetailUseCase,
      this._getDocumentUseCase, this._deleteCartUseCase);

  RxList<CartModel> carts = <CartModel>[].obs;

  Future<void> getAllCart() async {
    try {
      AppLoadingOverlayWidget.show();
      final result = await _getAllCartUseCase.executeList();

      if (result.netData != null) {
        for (var cart in result.netData!) {
          final cartResult = await _getCartDetailUseCase.executeObject(
            param: GetCartDetailParam(cartId: cart.id),
          );

          if (cartResult.netData != null) {
            final cartData = cartResult.netData as CartModel;

            // for (var cartItem in cartResult.netData!.cartItems) {
            //   cartItem.product.coverImageData =
            //       await getImage(cartItem.product.coverImage);
            // }

            carts.add(cartData);
          }
        }
      }

      AppLoadingOverlayWidget.dismiss();
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

  void increaseQuantity(String id) {
    // carts.firstWhere((element) => element.id == id).quantity++;
    // carts.refresh();
  }

  void decreaseQuantity(String id) {
    // final cartItem = carts.firstWhere((element) => element.id == id);
    // if (cartItem.quantity > 1) {
    //   cartItem.quantity--;
    // } else {
    //   carts.removeWhere((element) => element.id == id);
    // }
    // carts.refresh();
  }

  Future<void> deleteCart(String id) async {
    await _deleteCartUseCase.executeObject(
      param: DeleteCartParam(
        cartId: id,
      ),
    );

    await getAllCart();
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
