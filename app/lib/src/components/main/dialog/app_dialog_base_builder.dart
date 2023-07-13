import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'app_dialog_default_widget.dart';

part 'app_dialog_screen_widget.dart';

enum AppDialogType {
  success(type: 'success'),
  error(type: 'error'),
  confirm(type: 'confirm');

  final String type;
  const AppDialogType({required this.type});
}

enum AppDialogButtonType {
  standard(type: 'standard'),
  danger(type: 'danger');
  final String type;
  const AppDialogButtonType({required this.type});
}

abstract class AppDialogBaseBuilder {
  @protected
  Dialog? _dialog;
  @protected
  String? _title;
  @protected
  String? _content;
  @protected
  String? _positiveText;
  @protected
  String? _negativeText;
  @protected
  Widget? _icon;
  @protected
  AppDialogType? _appDialogType;
  @protected
  void Function()? _onPositive;
  @protected
  void Function()? _onNegative;
  @protected
  Widget? _textField;
  @protected
  AppDialogButtonType? _appDialogButtonType;

  AppDialogBaseBuilder setTextField(Widget? textField) {
    return this;
  }

  AppDialogBaseBuilder setTitle(String? title) {
    return this;
  }

  AppDialogBaseBuilder setContent(String? content) {
    return this;
  }

  AppDialogBaseBuilder setPositiveText(String? positiveText) {
    return this;
  }

  AppDialogBaseBuilder setNegativeText(String? negativeText) {
    return this;
  }

  AppDialogBaseBuilder setIcon(Widget? icon) {
    return this;
  }

  AppDialogBaseBuilder setAppDialogType(AppDialogType? type) {
    return this;
  }
  AppDialogBaseBuilder setOnPositive(void Function()? onPositive) {
    return this;
  }

  AppDialogBaseBuilder setOnNegative(void Function()? onNegative) {
    return this;
  }

  AppDialogBaseBuilder setAppDialogButtonType(AppDialogButtonType? appDialogButtonType) {
    return this;
  }

  AppDialogBaseBuilder buildDialog(BuildContext context);

  void show() {
    if (_dialog == null) return;
    if (Get.isDialogOpen == true) return;
    Get.dialog(_dialog!, barrierDismissible: false, useSafeArea: false);
  }
}
