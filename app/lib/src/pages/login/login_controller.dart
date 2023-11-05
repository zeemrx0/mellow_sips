import 'dart:io';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/storeList/store_list_controller.dart';
import 'package:app/src/pages/verify/verify_registration_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './login_page.dart';

part './login_binding.dart';

class LoginErrorMessage {
  LoginErrorMessage._();

  static const String incorrectUsernameOrPassword =
      'Incorrect username or password';
}

class LoginKey {
  LoginKey._();

  static const String phoneNumber = 'phoneNumber';
  static const String password = 'password';
}

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final RequestOtpUseCase _requestOtpUseCase;

  LoginController(
    this._loginUseCase,
    this._requestOtpUseCase,
  );

  final loginFormKey = GlobalKey<FormBuilderState>();
  final FocusNode passwordFocusNode = FocusNode();
  Rx<bool> isPasswordShown = false.obs;

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '${R.strings.phoneNumber} ${R.strings.cannotBeEmpty}';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '${R.strings.password} ${R.strings.cannotBeEmpty}';
    }

    return null;
  }

  void togglePasswordVisibility() {
    isPasswordShown.value = !isPasswordShown.value;
    FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
  }

  Future<void> login() async {
    try {
      if (loginFormKey.currentState!.saveAndValidate()) {
        final formData = loginFormKey.currentState!.value;
        final phoneNumber =
            '84${(formData[LoginKey.phoneNumber] as String).substring(1)}';

        AppLoadingOverlayWidget.show();

        final result = await _loginUseCase.executeObject(
          param: LoginParam(
            username: phoneNumber,
            password: formData[LoginKey.password],
          ),
        );

        AppLoadingOverlayWidget.dismiss();

        if (result.netData != null) {
          StoreListPage.open();
        }
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();

      if (e.statusCode == HttpStatus.notFound ||
          (e.statusCode == HttpStatus.badRequest &&
              e.message == LoginErrorMessage.incorrectUsernameOrPassword)) {
        AppDefaultDialogWidget()
            .setContent(R.strings.incorrectUsernameOrPassword)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.close)
            .buildDialog(Get.context!)
            .show();

        return;
      }

      if (e.statusCode == HttpStatus.unauthorized) {
        AppDefaultDialogWidget()
            .setContent(R.strings.accountHasNotBeenVerified)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.verifyAccount)
            .setOnPositive(() {
              final formData = loginFormKey.currentState!.value;
              final phoneNumber =
                  '84${(formData[LoginKey.phoneNumber] as String).substring(1)}';

              _requestOtpUseCase.executeObject(
                param: RequestOtpParam(
                  username: phoneNumber,
                ),
              );
              VerifyRegistrationPage.open(phoneNumber: phoneNumber);
            })
            .buildDialog(Get.context!)
            .show();

        return;
      }

      AppDefaultDialogWidget()
          .setContent(R.strings.error)
          .setAppDialogType(AppDialogType.error)
          .setPositiveText(R.strings.close)
          .buildDialog(Get.context!)
          .show();

      return;
    }
  }
}
