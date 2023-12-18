import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './app_bottom_navigation_bar_widget.dart';

class AppBottomNavigationBarController extends GetxController {
  final pageController = PageController();

  Rx<int> page = Rx<int>(0);
}
