import 'dart:convert';

import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class StoreItemWidget extends StatelessWidget {
  final StoreModel store;

  const StoreItemWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppThemeExt.of.majorScale(105 / 4),
      color: AppColors.of.whiteColor,
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppThemeExt.of.majorScale(4),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.of.dividerColor,
              width: AppThemeExt.of.majorScale(1 / 4),
            ),
          ),
        ),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppThemeExt.of.majorScale(3),
                  ),
                  child: SizedBox(
                    height: AppThemeExt.of.majorScale(72 / 4),
                    width: AppThemeExt.of.majorScale(72 / 4),
                    child: Image.memory(
                      base64Decode(store.coverImage ?? ''),
                    ),
                  ),
                ),
                if (store.hasPromotion ?? false) _promotionTag(context),
              ],
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(3),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBody2Widget()
                          .setText(store.name)
                          .setTextStyle(
                            AppTextStyleExt.of.textBody2s?.copyWith(
                              fontFamily: R.fontFamily.workSans,
                            ),
                          )
                          .build(context),
                      SizedBox(
                        height: AppThemeExt.of.majorScale(1),
                      ),
                      AppTextCaption1Widget()
                          .setText(store.address)
                          .setColor(AppColors.of.grayColor[700])
                          .build(context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _rating(context),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorScale(2),
                        ),
                        height: AppThemeExt.of.majorScale(3 / 4),
                        width: AppThemeExt.of.majorScale(3 / 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.of.grayColor[500],
                        ),
                      ),
                      _distance(context),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorScale(2),
                        ),
                        height: AppThemeExt.of.majorScale(3 / 4),
                        width: AppThemeExt.of.majorScale(3 / 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.of.grayColor[500],
                        ),
                      ),
                      _type(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _promotionTag(BuildContext context) {
    return Positioned(
      top: -1 * AppThemeExt.of.majorScale(1),
      left: -1 * AppThemeExt.of.majorScale(2 / 4),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(6 / 4),
          vertical: AppThemeExt.of.majorScale(1 / 2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              AppThemeExt.of.majorScale(2 / 4),
            ),
            topRight: Radius.circular(
              AppThemeExt.of.majorScale(2 / 4),
            ),
            bottomRight: Radius.circular(
              AppThemeExt.of.majorScale(6 / 4),
            ),
            bottomLeft: Radius.circular(
              AppThemeExt.of.majorScale(2 / 4),
            ),
          ),
          color: AppColors.of.orangeColor,
        ),
        child: AppTextCaption2Widget()
            .setText(R.strings.promo)
            .setColor(AppColors.of.whiteColor)
            .build(context),
      ),
    );
  }

  Widget _rating(BuildContext context) {
    return Row(
      children: [
        R.svgs.icStarYellow.svg(
          height: AppThemeExt.of.majorScale(3),
          width: AppThemeExt.of.majorScale(3),
        ),
        SizedBox(
          width: AppThemeExt.of.majorScale(1),
        ),
        AppTextCaption1Widget()
            .setText(store.rating?.toString())
            .build(context),
      ],
    );
  }

  Widget _distance(BuildContext context) {
    /// TODO: Implement distance calculation
    return AppTextCaption1Widget().build(context);
  }

  Widget _type(BuildContext context) {
    return AppTextCaption1Widget().setText(store.type).build(context);
  }
}
