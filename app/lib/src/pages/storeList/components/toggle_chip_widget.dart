import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ToggleChipWidget {
  late final String _fieldKey;
  late final String _text;
  late final Function? _onClick;

  ToggleChipWidget setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
    return this;
  }

  ToggleChipWidget setText(String text) {
    _text = text;
    return this;
  }

  ToggleChipWidget setOnClick(Function onClick) {
    _onClick = onClick;
    return this;
  }

  Widget build(BuildContext context) {
    return FormBuilderField<bool>(
      name: _fieldKey,
      initialValue: false,
      builder: (field) {
        return InkWell(
          onTap: () {
            if (_onClick != null) {
              _onClick!.call();
            } else {
              field.didChange(!field.value!);
            }
          },
          child: Container(
            decoration: field.value == true
                ? _selectedDecoration()
                : _unselectedDecoration(),
            padding: EdgeInsets.symmetric(
              horizontal: AppThemeExt.of.majorPaddingScale(3),
              vertical: AppThemeExt.of.majorPaddingScale(6 / 4),
            ),
            child: AppTextCaption1Widget()
                .setText(_text)
                .setColor(
                  field.value == true
                      ? AppColors.of.whiteColor
                      : AppColors.of.grayColor[600]!,
                )
                .setTextStyle(
                  field.value == true
                      ? AppTextStyleExt.of.textCaption1s
                      : AppTextStyleExt.of.textCaption1r,
                )
                .build(context),
          ),
        );
      },
    );
  }

  BoxDecoration _unselectedDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.of.grayColor[500]!,
      ),
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(1000),
      ),
    );
  }

  BoxDecoration _selectedDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.of.primaryColor,
      ),
      color: AppColors.of.primaryColor,
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(1000),
      ),
    );
  }
}
