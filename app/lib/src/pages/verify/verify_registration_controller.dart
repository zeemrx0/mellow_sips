import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './verify_registration_page.dart';

part './verify_registration_binding.dart';

class VerifyRegistrationKey {
  static const otpDigit1 = 'otpDigit1';
  static const otpDigit2 = 'otpDigit2';
  static const otpDigit3 = 'otpDigit3';
  static const otpDigit4 = 'otpDigit4';
  static const otpDigit5 = 'otpDigit5';
  static const otpDigit6 = 'otpDigit6';
}

class VerifyRegistrationController extends GetxController {
  final verifyRegistrationFormKey = GlobalKey<FormBuilderState>();

  final otpDigitFocusNodes = [
    null,
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  // Future<void> submitVerificationRegistrationForm() {}
}
