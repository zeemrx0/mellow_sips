import 'dart:io';

import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'register_page.dart';

part 'register_binding.dart';

class RegisterKey {
  static const phoneNumber = 'phoneNumber';
  static const password = 'password';
  static const confirmPassword = 'confirmPassword';
  static const displayName = 'displayName';
}

class RegisterController extends GetxController {
  final RegisterUseCase _registerUserCase;

  RegisterController(this._registerUserCase);

  final registerFormKey = GlobalKey<FormBuilderState>();

  Future<void> register() async {
    try {
      if (registerFormKey.currentState!.saveAndValidate()) {
        final formData = registerFormKey.currentState!.value;

        await _registerUserCase.executeObject(
          param: RegisterParam(
            username: formData[RegisterKey.phoneNumber],
            displayName: formData[RegisterKey.displayName],
            type: 'PERSONAL',
            password: formData[RegisterKey.password],
          ),
        );

        // TODO: Go to verify page
        print('Register success');
      }
    } on AppException catch (e) {
      if (e.statusCode == HttpStatus.conflict) {
        // TODO: Show dialog
        print('Phone number is already in use');
        return;
      }
      // TODO: Show dialog
      print('Register failed');
      return;
    }
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return '${R.strings.phoneNumber} ${R.strings.cannotBeEmpty}';
    }

    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return '${R.strings.fullName} ${R.strings.cannotBeEmpty}';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '${R.strings.password} ${R.strings.cannotBeEmpty}';
    }

    RegExp passwordRegexp = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[\W_]).{8,}$');

    if (!passwordRegexp.hasMatch(password)) {
      return R.strings.passwordInvalid;
    }

    return null;
  }

  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return '${R.strings.confirmPassword} ${R.strings.cannotBeEmpty}';
    }

    final formData = registerFormKey.currentState!.value;
    final password = formData[RegisterKey.password];

    if (confirmPassword != password) {
      return R.strings.confirmPasswordDoesNotMatch;
    }

    return null;
  }
}
