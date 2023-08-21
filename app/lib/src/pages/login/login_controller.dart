import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'login_page.dart';

part 'login_binding.dart';

class LoginKey {
  LoginKey._();

  static const String phoneNumber = 'phoneNumber';
  static const String password = 'password';
}

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase);

  final loginFormKey = GlobalKey<FormBuilderState>();

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
          HomePage.open();
        }
      }
    } on AppException catch (_) {
      AppLoadingOverlayWidget.dismiss();

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