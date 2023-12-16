import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:resources/resources.dart';

part './verify_registration_page.dart';

part './verify_registration_binding.dart';

class VerifyRegistrationKey {
  static const phoneNumber = 'phoneNumber';
  static const otpDigit1 = 'otpDigit1';
  static const otpDigit2 = 'otpDigit2';
  static const otpDigit3 = 'otpDigit3';
  static const otpDigit4 = 'otpDigit4';
  static const otpDigit5 = 'otpDigit5';
  static const otpDigit6 = 'otpDigit6';
}

class VerifyRegistrationController extends GetxController {
  final VerifyRegistrationUseCase _verifyRegistrationUseCase;
  final RequestOtpUseCase _requestOtpUseCase;

  VerifyRegistrationController(
      this._verifyRegistrationUseCase, this._requestOtpUseCase);

  final verifyRegistrationFormKey = GlobalKey<FormBuilderState>();
  final phoneNumber =
      Get.arguments[VerifyRegistrationKey.phoneNumber] as String;

  final otpDigitFocusNodes = [
    null,
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  Future<void> submitVerificationRegistrationForm() async {
    try {
      if (verifyRegistrationFormKey.currentState!.saveAndValidate()) {
        final formData = verifyRegistrationFormKey.currentState!.value;

        AppLoadingOverlayWidget.show();

        final otp = formData[VerifyRegistrationKey.otpDigit1] +
            formData[VerifyRegistrationKey.otpDigit2] +
            formData[VerifyRegistrationKey.otpDigit3] +
            formData[VerifyRegistrationKey.otpDigit4] +
            formData[VerifyRegistrationKey.otpDigit5] +
            formData[VerifyRegistrationKey.otpDigit6];

        _verifyRegistrationUseCase.executeObject(
          param: VerifyRegistrationParam(
            username: phoneNumber,
            confirmationCode: otp,
          ),
        );

        AppLoadingOverlayWidget.dismiss();

        AppDefaultDialogWidget()
            .setContent(R.strings.verifySuccessfully)
            .setAppDialogType(AppDialogType.success)
            .setPositiveText(R.strings.goToLoginPage)
            .setOnPositive(() {
              Get.toNamed(Routes.login);
            })
            .buildDialog(Get.context!)
            .show();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();

      if (e.statusCode == HttpStatus.gone) {
        AppDefaultDialogWidget()
            .setContent(R.strings.otpHasBeenExpired)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.resendOtp)
            .setOnPositive(() {
              _requestOtpUseCase.executeObject(
                param: RequestOtpParam(
                  username: phoneNumber,
                ),
              );
            })
            .buildDialog(Get.context!)
            .show();

        return;
      }

      AppDefaultDialogWidget()
          .setContent(R.strings.errorOccurredPleaseTryAgain)
          .setAppDialogType(AppDialogType.error)
          .setPositiveText(R.strings.close)
          .buildDialog(Get.context!)
          .show();
      return;
    }
  }

  void resendOtp() {
    _requestOtpUseCase.executeObject(
      param: RequestOtpParam(
        username: phoneNumber,
      ),
    );
  }
}
