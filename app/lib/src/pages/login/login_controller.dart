import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    if (loginFormKey.currentState!.saveAndValidate()) {
      final inputPhoneNumber =
          loginFormKey.currentState!.fields[LoginKey.phoneNumber]!.value;
      final phoneNumber =
          '+84${inputPhoneNumber.toString().substring(1, inputPhoneNumber.toString().length)}';

      final result = await _loginUseCase.executeObject(
        param: LoginParam(
          phone: phoneNumber,
          password: loginFormKey.currentState!.fields[LoginKey.password]!.value,
        ),
      );

      if (result.netData != null) {
        // TODO: Go to Home Page
        print('Login success');
      } else {
        print('Login failed');
      }
    }
  }
}
