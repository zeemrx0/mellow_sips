import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:resources/resources.dart';

part './app_text_field_widget.dart';

enum AppTextFieldState {
  normal,
  enabled,
  disabled,
  focused,
  error,
}

abstract class AppTextFieldBaseBuilder {
  @protected
  GlobalKey<FormBuilderFieldState> _textFieldKey =
      GlobalKey<FormBuilderFieldState>();
  @protected
  late final String _fieldKey;
  @protected
  String? _hintText;
  @protected
  bool? _obscureText;
  @protected
  bool? _isReadOnly;
  @protected
  bool? _isDisabled;
  @protected
  AutovalidateMode? _autoValidateMode;
  @protected
  Widget? _prefixIcon;
  @protected
  Widget? _suffixIcon;
  @protected
  TextInputAction? _textInputAction;
  @protected
  String? Function(String? value)? _validator;
  @protected
  void Function(String? value)? _onChanged;
  @protected
  int? _maxLines;
  @protected
  int? _minLines;
  @protected
  TextInputType? _inputType;
  @protected
  FocusNode? _focusNode;
  @protected
  bool? _hasClearButton;
  @protected
  void Function(String? value)? _onSubmitted;
  @protected
  EdgeInsets? _contentPadding;
  @protected
  TextCapitalization? _textCapitalization;

  AppTextFieldBaseBuilder setFieldKey(String fieldKey) {
    return this;
  }

  AppTextFieldBaseBuilder setHintText(String? hintText) {
    return this;
  }

  AppTextFieldBaseBuilder setInitialValue(String? initialValue) {
    return this;
  }

  AppTextFieldBaseBuilder setObscureText(bool? obscureText) {
    return this;
  }

  AppTextFieldBaseBuilder setIsReadOnly(bool? isReadOnly) {
    return this;
  }

  AppTextFieldBaseBuilder setIsDisabled(bool? isDisabled) {
    return this;
  }

  AppTextFieldBaseBuilder setAutoValidateMode(
      AutovalidateMode autoValidateMode) {
    return this;
  }

  AppTextFieldBaseBuilder setValidator(
      String? Function(String? value)? validator) {
    return this;
  }

  AppTextFieldBaseBuilder setPrefixIcon(Widget? suffixIcon) {
    return this;
  }

  AppTextFieldBaseBuilder setSuffixIcon(Widget? suffixIcon) {
    return this;
  }

  AppTextFieldBaseBuilder setTextInputAction(TextInputAction? textInputAction) {
    return this;
  }

  AppTextFieldBaseBuilder setOnChanged(
      void Function(String? value)? onChanged) {
    return this;
  }

  AppTextFieldBaseBuilder setMaxLine(int? maxLines) {
    return this;
  }

  AppTextFieldBaseBuilder setMinLine(int? minLines) {
    return this;
  }

  AppTextFieldBaseBuilder setInputType(TextInputType? inputType) {
    return this;
  }

  AppTextFieldBaseBuilder setTextFieldKey(
      GlobalKey<FormBuilderFieldState> textFieldKey) {
    _textFieldKey = textFieldKey;
    return this;
  }

  AppTextFieldBaseBuilder setFocusNode(FocusNode? focusNode) {
    return this;
  }

  AppTextFieldBaseBuilder setHasClearButton(bool hasClearButton) {
    return this;
  }

  AppTextFieldBaseBuilder setOnSubmitted(Function(String? value)? onSubmitted) {
    return this;
  }

  AppTextFieldBaseBuilder setOnTap(Function()? ontap) {
    return this;
  }

  AppTextFieldBaseBuilder setContentPadding(EdgeInsets contentPadding) {
    return this;
  }

  AppTextFieldBaseBuilder setTextCapitalization(
      TextCapitalization textCapitalization) {
    return this;
  }

  Widget build(BuildContext context);
}
