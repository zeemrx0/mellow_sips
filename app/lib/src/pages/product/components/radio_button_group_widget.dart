import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppRadioButtonGroupWidget extends StatelessWidget {
  late final String _fieldKey;
  late final List<String> _options;

  AppRadioButtonGroupWidget({
    super.key,
    required String fieldKey,
    required List<String> options,
  }) {
    _fieldKey = fieldKey;
    _options = options;
  }

  void onPress(FormFieldState field, String value) {
    field.didChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: _fieldKey,
      initialValue: _options.first,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _radioButtons(context, field, _options),
          ],
        );
      },
    );
  }

  Widget _radioButtons(
      BuildContext context, FormFieldState field, List<String> options) {
    List<Widget> widgets = [];

    for (int i = 0; i < options.length; i++) {
      if (i > 0) {
        widgets.add(SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ));
      }

      widgets.add(_radioButton(context, field, options[i]));
    }

    return Column(
      children: widgets,
    );
  }

  Widget _radioButton(
      BuildContext context, FormFieldState field, String option) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.of.borderColor,
            width: 1,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {
          onPress(field, option);
        },
        child: Padding(
          padding: EdgeInsets.only(
            right: AppThemeExt.of.majorScale(2),
          ),
          child: Row(
            children: [
              Radio(
                activeColor: AppColors.of.primaryColor,
                splashRadius: AppThemeExt.of.majorScale(1),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: option,
                groupValue: field.value,
                onChanged: (value) {
                  onPress(field, option);
                },
              ),
              Expanded(
                child: AppTextBody2Widget().setText(option).build(context),
              ),
              AppTextBody2Widget().setText(option).build(context),
            ],
          ),
        ),
      ),
    );
  }
}
