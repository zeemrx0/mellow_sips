import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:configs/configs.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'home_binding.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  final GetTestUseCase _getTestUseCase;

  HomeController(this._getTestUseCase);

  Future<TestModel> getTest() {
    return _getTestUseCase.executeObject().then((value) {
      print(value.netData!.message);
      return value.netData!;
    });
  }
}
