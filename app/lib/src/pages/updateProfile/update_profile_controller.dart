import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './update_profile_page.dart';
part './update_profile_binding.dart';

class UpdateProfileKey {
  static const phoneNumber = Key('phoneNumber');
  static const displayName = Key('displayName');
}

class UpdateProfileController extends GetxController {
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetProfileUseCase _getProfileUseCase;

  UpdateProfileController(
    this._updateProfileUseCase,
    this._getProfileUseCase,
  );

  final formKey = GlobalKey<FormBuilderState>();

  Future<void> getProfile() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getProfileUseCase.executeObject();

      if (result.netData != null) {
        formKey.currentState!.patchValue({
          RegisterKey.phoneNumber: '0${result.netData!.phone.substring(2)}',
          RegisterKey.displayName: result.netData!.displayName,
        });
      }

      AppLoadingOverlayWidget.dismiss();

      if (result.netData != null) {}
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> updateProfile() async {
    try {
      if (formKey.currentState!.saveAndValidate()) {
        final formData = formKey.currentState!.value;

        AppLoadingOverlayWidget.show();

        await _updateProfileUseCase.executeObject(
          param: UpdateProfileParam(
            displayName: formData[RegisterKey.displayName],
          ),
        );

        AppLoadingOverlayWidget.dismiss();

        AppDefaultDialogWidget()
            .setContent(R.strings.updatedProfileSuccessfully)
            .setAppDialogType(AppDialogType.success)
            .setPositiveText(R.strings.close)
            .setOnPositive(() {
              Get.back();
            })
            .buildDialog(Get.context!)
            .show();
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return '${R.strings.phoneNumber} ${R.strings.cannotBeEmpty}';
    }

    return null;
  }
}
