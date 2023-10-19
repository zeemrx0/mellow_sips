import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:utilities/utilities.dart';

class RadioButtonGroupWidget extends StatelessWidget {
  final String fieldKey;
  final List<ProductAddonModel> addons;

  const RadioButtonGroupWidget({
    super.key,
    required this.fieldKey,
    required this.addons,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: fieldKey,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _radioButtons(context, field),
          ],
        );
      },
    );
  }

  Widget _radioButtons(
    BuildContext context,
    FormFieldState field,
  ) {
    List<Widget> widgets = [];

    for (int i = 0; i < addons.length; i++) {
      if (i > 0) {
        widgets.add(SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ));
      }

      widgets.add(_radioButton(context, field, addons[i]));
    }

    return Column(
      children: widgets,
    );
  }

  Widget _radioButton(
      BuildContext context, FormFieldState field, ProductAddonModel addon) {
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
          field.didChange(addon);
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
                value: addon,
                groupValue: field.value,
                onChanged: (value) {
                  field.didChange(value);
                },
              ),
              Expanded(
                child: AppTextBody2Widget().setText(addon.name).build(context),
              ),
              AppTextBody2Widget()
                  .setText('${NumberExt.withSeparator(addon.price)}đ')
                  .build(context),
            ],
          ),
        ),
      ),
    );
  }
}
