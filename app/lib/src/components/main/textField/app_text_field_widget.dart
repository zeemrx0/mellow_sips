part of 'app_text_field_base_builder.dart';

class AppTextFieldWidget extends AppTextFieldBaseBuilder {
  @override
  AppTextFieldWidget setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
    return this;
  }

  @override
  AppTextFieldWidget setHintText(String? hintText) {
    _hintText = hintText;
    return this;
  }

  @override
  AppTextFieldWidget setObscureText(bool? obscureText) {
    _obscureText = obscureText;
    return this;
  }

  @override
  AppTextFieldWidget setIsReadOnly(bool? isReadOnly) {
    _isReadOnly = isReadOnly;
    return this;
  }

  @override
  AppTextFieldWidget setIsDisabled(bool? isDisabled) {
    _isDisabled = isDisabled;
    return this;
  }

  @override
  AppTextFieldWidget setAutoValidateMode(AutovalidateMode autoValidateMode) {
    _autoValidateMode = autoValidateMode;
    return this;
  }

  @override
  AppTextFieldWidget setSuffixIcon(Widget? suffixIcon) {
    _suffixIcon = suffixIcon;
    return this;
  }

  @override
  AppTextFieldWidget setTextInputAction(TextInputAction? textInputAction) {
    _textInputAction = textInputAction;
    return this;
  }

  @override
  AppTextFieldWidget setValidator(String? Function(String? value)? validator) {
    _validator = validator;
    return this;
  }

  @override
  AppTextFieldWidget setOnChanged(void Function(String? value)? onChanged) {
    _onChanged = onChanged;
    return this;
  }

  @override
  AppTextFieldWidget setMaxLine(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextFieldWidget setMinLine(int? minLines) {
    _minLines = minLines;
    return this;
  }

  @override
  AppTextFieldWidget setInputType(TextInputType? inputType) {
    _inputType = inputType;
    return this;
  }

  @override
  AppTextFieldWidget setFocusNode(FocusNode? focusNode) {
    _focusNode = focusNode;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setHasClearButton(bool hasClearButton) {
    _hasClearButton = hasClearButton;
    return this;
  }

  @override
  AppTextFieldWidget setOnSubmitted(Function(String? value)? onSubmitted) {
    _onSubmitted = onSubmitted;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setContentPadding(EdgeInsets contentPadding) {
    _contentPadding = contentPadding;
    return this;
  }

  @override
  AppTextFieldBaseBuilder setTextCapitalization(
      TextCapitalization textCapitalization) {
    _textCapitalization = textCapitalization;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    BoxConstraints suffixIconConstraints = BoxConstraints.expand(
      width: AppThemeExt.of.majorScale(11),
      height: AppThemeExt.of.majorScale(11),
    );

    return FormBuilderTextField(
      key: _textFieldKey,
      name: _fieldKey,
      initialValue: _textFieldKey.currentState?.value,
      readOnly: _isReadOnly ?? false,
      enabled: _isDisabled == null || _isDisabled == false,
      style: _contentTextStyle(context),
      obscureText: _obscureText ?? false,
      textInputAction: _textInputAction ?? TextInputAction.next,
      textCapitalization: _textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        prefix: Padding(
          padding: EdgeInsets.only(
            left: AppThemeExt.of.majorScale(4),
          ),
        ),
        isDense: true,
        contentPadding: _contentPadding ?? EdgeInsets.zero,
        hintText: _hintText,
        hintStyle: _hintTextStyle(context),
        border: _inputBorder(context, AppTextFieldState.normal),
        enabledBorder: _inputBorder(context, AppTextFieldState.enabled),
        focusedBorder: _inputBorder(context, AppTextFieldState.focused),
        disabledBorder: _inputBorder(context, AppTextFieldState.disabled),
        errorBorder: _inputBorder(context, AppTextFieldState.error),
        errorStyle: AppTextStyleExt.of.textBody2r?.copyWith(
          color: AppColors.of.redColor,
          height: 1,
        ),
        suffixIconConstraints: suffixIconConstraints,
        suffixIcon: _suffixIcon ??
            (_hasClearButton
                ? InkWell(
                    child: const Icon(Icons.clear_rounded),
                    onTap: () {
                      _textFieldKey.currentState?.didChange('');
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  )
                : const SizedBox()),
      ),
      autovalidateMode: _autoValidateMode,
      validator: _validator,
      onChanged: _onChanged,
      maxLines: _maxLines,
      minLines: _minLines,
      keyboardType: _inputType ?? TextInputType.text,
      focusNode: _focusNode,
      onSubmitted: _onSubmitted,
    );
  }

  InputBorder _inputBorder(
    BuildContext context,
    AppTextFieldState appTextFieldState,
  ) {
    Color borderColor = AppColors.of.grayColor[500] ?? AppColors.of.grayColor;

    switch (appTextFieldState) {
      case AppTextFieldState.normal:
        borderColor = AppColors.of.borderColor;
        break;
      case AppTextFieldState.focused:
        borderColor = AppColors.of.primaryColor;
        break;
      case AppTextFieldState.error:
        borderColor = AppColors.of.redColor[500] ?? AppColors.of.redColor;
        break;
      case AppTextFieldState.enabled:
        borderColor = AppColors.of.borderColor;
        break;
      case AppTextFieldState.disabled:
        borderColor = AppColors.of.disabledBorderColor;
        break;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(10 / 4),
      ),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }

  TextStyle? _contentTextStyle(BuildContext context) =>
      AppTextStyleExt.of.textBody2r?.copyWith(
        color: AppColors.of.grayColor,
      );

  TextStyle? _hintTextStyle(BuildContext context) =>
      AppTextStyleExt.of.textBody2r?.copyWith(
        color: AppColors.of.grayColor[400],
      );
}
