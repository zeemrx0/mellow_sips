import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
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
  final registerFormKey = GlobalKey<FormBuilderState>();
}
