import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:utilities/utilities.dart';

class CheckboxButtonGroupWidget extends StatelessWidget {
  final String fieldKey;
  final List<ProductAddonModel> addons;

  const CheckboxButtonGroupWidget({
    super.key,
    required this.fieldKey,
    required this.addons,
  });

  @override
  Widget build(BuildContext context) {
    List<String> selectedOptionIds = [];

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
                        field.didChange(selectedOptionIds);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: AppThemeExt.of.majorScale(2),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: selectedOptionIds.contains(addon.id),
                              activeColor: AppColors.of.primaryColor,
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) =>
                                    AppColors.of.grayColor[300],
                              ),
                              side: BorderSide(color: AppColors.of.borderColor),
                              onChanged: (value) {
                                if (value == true) {
                                  selectedOptionIds.add(addon.id);
                                } else {
                                  selectedOptionIds.remove(addon.id);
                                }
                                field.didChange(selectedOptionIds);
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
