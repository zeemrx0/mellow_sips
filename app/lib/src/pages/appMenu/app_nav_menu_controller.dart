import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/bottomNavigationBar/app_bottom_navigation_bar_widget.dart';
import 'package:app/src/components/features/floatingAppButton/floating_app_button.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'app_nav_menu_page.dart';
part 'app_nav_menu_binding.dart';

class AppNavMenuController extends GetxController {
  final GetTokensUseCase _getTokensUseCase;
  final LogoutUseCase _logoutUseCase;

  Rx<bool> isLoggedIn = Rx<bool>(false);

  AppNavMenuController(
    this._getTokensUseCase,
    this._logoutUseCase,
  );

  Future<void> checkIsLoggedIn() async {
    try {
      final result = await _getTokensUseCase.executeObject();

      if (result.netData?.accessToken != null &&
          result.netData!.accessToken.isNotEmpty) {
        isLoggedIn.value = true;
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> logOut() async {
    try {
      AppLoadingOverlayWidget.show();

      await _logoutUseCase.executeObject();

      Get.offNamedUntil(
        Routes.welcome,
        (route) {
          return route.settings.name == Routes.home;
        },
      );

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
