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

class CartItemModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final int price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class CartController extends GetxController {
  final GetAllCartUseCase _getAllCartUseCase;

  CartController(this._getAllCartUseCase);

  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  Future<void> getAllCart() async {
    try {
      AppLoadingOverlayWidget.show();
      final result = await _getAllCartUseCase.executeList();

      print(result.netData!.first);
      AppLoadingOverlayWidget.dismiss();
    } catch (e) {
      AppLoadingOverlayWidget.dismiss();
      print(e);
    }
  }

  int totalPrice() {
    return cartItems.fold(
      0,
      (previousValue, element) =>
          previousValue + element.price * element.quantity,
    );
  }

  void increaseQuantity(String id) {
    cartItems.firstWhere((element) => element.id == id).quantity++;
    cartItems.refresh();
  }

  void decreaseQuantity(String id) {
    final cartItem = cartItems.firstWhere((element) => element.id == id);
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      cartItems.removeWhere((element) => element.id == id);
    }
    cartItems.refresh();
  }

  void removeItem(String id) {
    cartItems.removeWhere((element) => element.id == id);
    cartItems.refresh();
  }
}
