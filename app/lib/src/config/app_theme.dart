import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'exts/app_theme_ext.dart';
part 'exts/app_text_style_ext.dart';

part 'app_colors.dart';
part 'app_text_style.dart';
part 'app_button_style.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = themeData(AppColors(Brightness.light));
  static ThemeData darkTheme = themeData(AppColors(Brightness.dark));

  static ThemeData themeData(AppColors appColor) {
    /// NOTE:
    /// Use Default MaterialDesign FontFamily (Roboto)
    /// Only modify them color
    return ThemeData(
      // Use Material Design version 3
      useMaterial3: true,
      fontFamily: R.fontFamily.comfortaa,
      package: 'resources',
      textTheme: _AppTextStyle.textTheme(appColor),
      filledButtonTheme:
          FilledButtonThemeData(style: AppButtonStyle.filledButtonStyle),
      textButtonTheme:
          TextButtonThemeData(style: AppButtonStyle.textButtonStyle),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: AppButtonStyle.outlinedButtonStyle),
    );
  }
}
