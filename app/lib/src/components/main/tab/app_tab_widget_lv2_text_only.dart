part of 'app_tab_base_builder.dart';

class AppTabWidgetLv2TextOnly extends AppTabBaseBuilder {
  @override
  AppTabWidgetLv2TextOnly setText(String text) {
    _text = text;
    return this;
  }

  @override
  AppTabWidgetLv2TextOnly setIsSelected(bool isSelected) {
    _isSelected = isSelected;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(AppThemeExt.of.majorScale(8))),
        color: _isSelected!
            ? AppColors.of.primaryColor[50]
            : AppColors.of.whiteColor,
        border: Border.all(
          color: _isSelected!
              ? AppColors.of.primaryColor
              : AppColors.of.borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorScale(2),
          horizontal: AppThemeExt.of.majorScale(3),
        ),
        child: AppTextCaption1Widget()
            .setText(_text)
            .setTextAlign(TextAlign.center)
            .setColor(_isSelected!
                ? AppColors.of.primaryColor
                : AppColors.of.borderColor)
            .build(context),
      ),
    );
  }
}
