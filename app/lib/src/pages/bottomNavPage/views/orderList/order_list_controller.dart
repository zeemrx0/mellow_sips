import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/tabBar/app_tab_bar_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/views/cancelled_order_list_view.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/views/completed_order_list_view.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/views/preparing_order_list_view.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/views/received_order_list_view.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/views/waiting_for_confirmed_order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './order_list_page.dart';

class OrderListKey {
  static const filter = 'filter';
}

class OrderListController extends GetxController {}
