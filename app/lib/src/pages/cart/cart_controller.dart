import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/cart/components/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'cart_binding.dart';

part 'cart_page.dart';

class CartItemModel {
  final String name;
  final String description;
  final String image;
  final int price;
  final int quantity;

  CartItemModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });
}

class CartController extends GetxController {
  final RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  void getCart() async {
    cartItems.value = [
      CartItemModel(
        name: 'Product 1',
        description: 'Description 1',
        image:
            'https://insanelygoodrecipes.com/wp-content/uploads/2020/07/Cup-Of-Creamy-Coffee-500x375.png',
        price: 50000,
        quantity: 1,
      ),
      CartItemModel(
        name: 'Product 2',
        description: 'Description 2',
        image:
            'https://file.hstatic.net/1000075078/article/blog_f80b599183c340bca744c174e7ab2af8.jpg',
        price: 50000,
        quantity: 2,
      ),
      CartItemModel(
        name: 'Product 3',
        description: 'Description 3',
        image:
            'https://cdn.tgdd.vn/Files/2021/11/15/1397993/ca-phe-nam-mushroom-coffee-la-gi-loi-ich-cua-ca-phe-nam-202111150713402556.jpg',
        price: 50000,
        quantity: 3,
      ),
    ];
  }

  int totalPrice() {
    return cartItems.fold(
      0,
      (previousValue, element) => previousValue + element.price * element.quantity,
    );
  }
}
