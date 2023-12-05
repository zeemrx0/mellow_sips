import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/bottomNavigationBar/app_bottom_navigation_bar_widget.dart';
import 'package:app/src/components/features/floatingAppButton/floating_app_button.dart';
import 'package:app/src/components/features/tabBar/app_tab_bar_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/orders/orderList/controllers/cancelled_order_list_controller.dart';
import 'package:app/src/pages/orders/orderList/controllers/completed_order_list_controller.dart';
import 'package:app/src/pages/orders/orderList/controllers/preparing_order_list_controller.dart';
import 'package:app/src/pages/orders/orderList/controllers/received_order_list_controller.dart';
import 'package:app/src/pages/orders/orderList/controllers/waiting_for_confirm_order_list_controller.dart';
import 'package:app/src/pages/orders/orderList/views/cancelled_order_list_view.dart';
import 'package:app/src/pages/orders/orderList/views/completed_order_list_view.dart';
import 'package:app/src/pages/orders/orderList/views/preparing_order_list_view.dart';
import 'package:app/src/pages/orders/orderList/views/received_order_list_view.dart';
import 'package:app/src/pages/orders/orderList/views/waiting_for_confirmed_order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './order_list_page.dart';
part './order_list_binding.dart';

class OrderListKey {
  static const filter = 'filter';
}

class OrderListController extends GetxController {}
