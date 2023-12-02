import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

class FoodItemWidget extends StatelessWidget {
  final String id;
  final String? imageData;
  final String name;
  final String description;
  final int price;
  final Function onPressed;

  const FoodItemWidget({
    super.key,
    required this.id,
    required this.imageData,
    required this.name,
    required this.description,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: AppThemeExt.of.majorScale(105 / 4),
        decoration: BoxDecoration(
          color: AppColors.of.whiteColor,
          border: Border(
            bottom: BorderSide(
              color: AppColors.of.dividerColor,
              width: 1,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorPaddingScale(4),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppThemeExt.of.majorScale(4),
              ),
              child: DataImageWidget(
                height: AppThemeExt.of.majorScale(72 / 4),
                width: AppThemeExt.of.majorScale(72 / 4),
                imageData: imageData,
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(3),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBody1Widget()
                          .setText(name)
                          .setMaxLines(1)
                          .setTextOverFlow(TextOverflow.ellipsis)
                          .setTextStyle(AppTextStyleExt.of.textBody1s)
                          .build(context),
                      SizedBox(
                        height: AppThemeExt.of.majorScale(2 / 4),
                      ),
                      AppTextBody2Widget()
                          .setText(description)
                          .setMaxLines(1)
                          .setTextOverFlow(TextOverflow.ellipsis)
                          .setColor(AppColors.of.subTextColor)
                          .build(context),
                    ],
                  ),
                  AppTextBody2Widget()
                      .setText('${NumberExt.withSeparator(price)}đ')
                      .setColor(AppColors.of.primaryColor)
                      .setTextStyle(AppTextStyleExt.of.textBody2s)
                      .build(context),
                ],
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(3),
            ),
          ],
        ),
      ),
    );
  }
}
