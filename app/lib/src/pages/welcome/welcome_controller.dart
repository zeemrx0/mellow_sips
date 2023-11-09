import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/login/login_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './welcome_page.dart';
part './welcome_binding.dart';

class WelcomeController extends GetxController {
  final GetTokensUseCase _getTokensUseCase;
  final LogoutUseCase _logoutUseCase;

  WelcomeController(this._getTokensUseCase, this._logoutUseCase);

  Future<void> logOut() async {
    await _logoutUseCase.executeObject();
  }

  Future<void> checkIsLoggedIn() async {
    try {
      final result = await _getTokensUseCase.executeObject();

      if (result.netData?.accessToken != null &&
          result.netData!.accessToken.isNotEmpty) {
        await Get.offAllNamed(Routes.home);
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
