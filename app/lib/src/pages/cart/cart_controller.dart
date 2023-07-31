import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/cart/components/cart_item_widget.dart';
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
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  void getCart() async {
    cartItems.value = [
      CartItemModel(
        id: '1',
        name: 'Capuchino',
        description: 'Đây là capuchino',
        image:
            'https://insanelygoodrecipes.com/wp-content/uploads/2020/07/Cup-Of-Creamy-Coffee-500x375.png',
        price: 50000,
        quantity: 1,
      ),
      CartItemModel(
        id: '2',
        name: 'Esspresso',
        description: 'Cà phê pha máy',
        image:
            'https://file.hstatic.net/1000075078/article/blog_f80b599183c340bca744c174e7ab2af8.jpg',
        price: 50000,
        quantity: 2,
      ),
      CartItemModel(
        id: '3',
        name: 'Tà tưa',
        description: 'Trà sữa nhưng dẹo',
        image:
            'https://assets.epicurious.com/photos/629f98926e3960ec24778116/1:1/w_2560%2Cc_limit/BubbleTea_RECIPE_052522_34811.jpg',
        price: 50000,
        quantity: 3,
      ),
    ];
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
