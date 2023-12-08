import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class ToggleChipWidget extends StatelessWidget {
  final String text;
  final Function? onClick;
  final bool status;

  const ToggleChipWidget({
    super.key,
    required this.text,
    this.onClick,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        decoration: status ? _selectedDecoration() : _unselectedDecoration(),
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorPaddingScale(3),
          vertical: AppThemeExt.of.majorPaddingScale(6 / 4),
        ),
        child: AppTextCaption1Widget()
            .setText(text)
            .setColor(
              status ? AppColors.of.whiteColor : AppColors.of.grayColor[600]!,
            )
            .setTextStyle(
              status
                  ? AppTextStyleExt.of.textCaption1s
                  : AppTextStyleExt.of.textCaption1r,
            )
            .build(context),
      ),
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
