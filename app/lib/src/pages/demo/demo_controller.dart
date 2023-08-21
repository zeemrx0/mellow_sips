// ignore_for_file: avoid_print

import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'demo_binding.dart';

part 'demo_page.dart';

class DemoController extends GetxController {
  final GetTestUseCase _getTestUseCase;
  final GetLocalTestUseCase _getLocalTestUseCase;
  final SaveLocalTestUseCase _saveLocalTestUseCase;

  DemoController(this._getTestUseCase, this._getLocalTestUseCase,
      this._saveLocalTestUseCase);

  Future<TestModel> getTest() async {
    final response = await _getTestUseCase.executeObject();
    return response.netData!;
  }

  Future<TestModel> getLocalTest() async {
    final response = await _getLocalTestUseCase.executeObject();
    print('getLocalTest: ${response.netData!.message}');
    return response.netData!;
  }

  Future<void> saveLocalTest({
    required String message,
  }) async {
    await _saveLocalTestUseCase.executeObject(
      param: TestParam(message: message),
    );
  }
}
