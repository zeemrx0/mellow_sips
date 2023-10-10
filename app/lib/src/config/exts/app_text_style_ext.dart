// ignore_for_file: constant_identifier_names, unused_element
part of '../app_theme.dart';

class AppTextStyleExt {
  AppTextStyleExt._();

  static AppTextStyleExt get of => AppTextStyleExt._();

  TextStyle? textHeading1b = Get.textTheme.displayLarge?.copyWith(
    fontWeight: _AppTextStyle.bold,
  );

  TextStyle? textHeading2b = Get.textTheme.displayMedium?.copyWith(
    fontWeight: _AppTextStyle.bold,
  );

  TextStyle? textHeading3b = Get.textTheme.displaySmall?.copyWith(
    fontWeight: _AppTextStyle.bold,
  );

  TextStyle? textHeading4s = Get.textTheme.headlineLarge?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textHeading5s = Get.textTheme.headlineMedium?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textHeading6s = Get.textTheme.headlineSmall?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textBody1b = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.bold,
  );

  TextStyle? textBody1s = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textBody1m = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.medium,
  );

  TextStyle? textBody1r = Get.textTheme.bodyLarge?.copyWith(
    fontWeight: _AppTextStyle.regular,
  );

  TextStyle? textBody2b = Get.textTheme.bodyMedium?.copyWith(
    fontWeight: _AppTextStyle.bold,
  );

  TextStyle? textBody2s = Get.textTheme.bodyMedium?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textBody2m = Get.textTheme.bodyMedium?.copyWith(
    fontWeight: _AppTextStyle.medium,
  );

  TextStyle? textBody2r = Get.textTheme.bodyMedium?.copyWith(
    fontWeight: _AppTextStyle.regular,
  );

  TextStyle? textCaption1s = Get.textTheme.labelLarge?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textCaption1r = Get.textTheme.labelLarge?.copyWith(
    fontWeight: _AppTextStyle.regular,
  );

  TextStyle? textCaption2s = Get.textTheme.labelMedium?.copyWith(
    fontWeight: _AppTextStyle.semiBold,
  );

  TextStyle? textCaption2r = Get.textTheme.labelMedium?.copyWith(
    fontWeight: _AppTextStyle.regular,
  );
}
