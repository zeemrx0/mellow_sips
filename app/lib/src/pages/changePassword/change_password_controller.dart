import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/exts/app_message.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './change_password_page.dart';
part './change_password_binding.dart';

class ChangePasswordKey {
  static const oldPassword = 'oldPassword';
  static const newPassword = 'newPassword';
  static const confirmNewPassword = 'confirmNewPassword';
}

class ChangePasswordController extends GetxController {
  final ChangePasswordUseCase _changePasswordUseCase;
  final GetProfileUseCase _getProfileUseCase;

  ChangePasswordController(
    this._changePasswordUseCase,
    this._getProfileUseCase,
  );

  final formKey = GlobalKey<FormBuilderState>();

  Rx<bool> isOldPasswordShown = false.obs;
  Rx<bool> isNewPasswordShown = false.obs;
  Rx<bool> isConfirmNewPasswordShown = false.obs;
  final FocusNode oldPasswordFocusNode = FocusNode();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmNewPasswordFocusNode = FocusNode();

  Future<void> changePassword() async {
    try {
      if (formKey.currentState!.saveAndValidate()) {
        final formData = formKey.currentState!.value;

        AppLoadingOverlayWidget.show();

        final profileData = await _getProfileUseCase.executeObject();

        await _changePasswordUseCase.executeObject(
          param: ChangePasswordParam(
            username: profileData.netData!.phone,
            password: formData[ChangePasswordKey.oldPassword],
            newPassword: formData[ChangePasswordKey.newPassword],
          ),
        );

        AppLoadingOverlayWidget.dismiss();

        AppDefaultDialogWidget()
            .setContent(R.strings.changedPasswordSuccessfully)
            .setAppDialogType(AppDialogType.success)
            .setPositiveText(R.strings.confirm)
            .setOnPositive(() {
              Get.back();
            })
            .buildDialog(Get.context!)
            .show();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();

      if (e.message == AppMessage.incorrectUsernameOrPassword) {
        AppDefaultDialogWidget()
            .setContent(R.strings.incorrectOldPassword)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.close)
            .buildDialog(Get.context!)
            .show();

        return;
      }

      AppExceptionExt(appException: e).detected();
    }
  }

  void toggleOldPasswordVisibility() {
    isOldPasswordShown.value = !isOldPasswordShown.value;
    FocusScope.of(Get.context!).requestFocus(oldPasswordFocusNode);
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordShown.value = !isNewPasswordShown.value;
    FocusScope.of(Get.context!).requestFocus(newPasswordFocusNode);
  }

  void toggleConfirmNewPasswordVisibility() {
    isConfirmNewPasswordShown.value = !isConfirmNewPasswordShown.value;
    FocusScope.of(Get.context!).requestFocus(confirmNewPasswordFocusNode);
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

    final formData = formKey.currentState!.value;
    final password = formData[ChangePasswordKey.newPassword];

    print('password: $password');
    print('confirmPassword: $confirmPassword');

    if (confirmPassword != password) {
      print(password != confirmPassword);
      return R.strings.confirmPasswordDoesNotMatch;
    }

    return null;
  }
}
