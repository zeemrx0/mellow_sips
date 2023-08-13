import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
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
  final formKey = GlobalKey<FormBuilderState>();
}