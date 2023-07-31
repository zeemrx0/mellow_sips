// ignore_for_file: constant_identifier_names, unused_element
part of '../app_theme.dart';

class AppTextStyleExt {
  AppTextStyleExt._();

  static AppTextStyleExt get of => AppTextStyleExt._();

  TextStyle? textBody1r = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.regular,
  );

  TextStyle? textBody1s = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textBody1m = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.medium,
  );

  TextStyle? textBody1rUnderline = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.regular,
    decoration: TextDecoration.underline,
  );

  TextStyle? textBody1rItalic = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.regular,
    fontStyle: FontStyle.italic,
  );
}
