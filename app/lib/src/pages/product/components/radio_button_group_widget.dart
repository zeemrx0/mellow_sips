import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:utilities/utilities.dart';

class RadioButtonGroupWidget extends StatelessWidget {
  final String fieldKey;
  final List<ProductAddonModel> addons;
  final String? initialValue;
  final Function? onChanged;

  const RadioButtonGroupWidget({
    super.key,
    required this.fieldKey,
    this.initialValue,
    required this.addons,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOptionId = initialValue;

    return FormBuilderField(
      name: fieldKey,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...addons
                .map(
                  (addon) => Container(
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
                        field.didChange(addon.id);
                        onChanged?.call();
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
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: addon.id,
                              groupValue: selectedOptionId,
                              onChanged: (value) {
                                field.didChange(value);
                              },
                            ),
                            Expanded(
                              child: AppTextBody2Widget()
                                  .setText(addon.name)
                                  .build(context),
                            ),
                            AppTextBody2Widget()
                                .setText(
                                    '${NumberExt.withSeparator(addon.price)}đ')
                                .build(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
