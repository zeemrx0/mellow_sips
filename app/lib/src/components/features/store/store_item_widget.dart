import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

class StoreItemWidget extends StatelessWidget {
  final StoreModel store;

  const StoreItemWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.storeDetail,
          arguments: {
            AppConstants.storeId: store.id,
          },
        );
      },
      child: Container(
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
                  DataImageWidget(
                    imageData: store.coverImageData,
                    width: AppThemeExt.of.majorScale(72 / 4),
                    height: AppThemeExt.of.majorScale(72 / 4),
                    borderRadius: BorderRadius.circular(
                      AppThemeExt.of.majorScale(2),
                    ),
                  ),
                  if (store.isOpen == false)
                    Container(
                      width: AppThemeExt.of.majorScale(72 / 4),
                      height: AppThemeExt.of.majorScale(72 / 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppThemeExt.of.majorScale(2),
                        ),
                        color: AppColors.of.blackColor.withOpacity(0.5),
                      ),
                      child: Center(
                        child: AppTextCaption1Widget()
                            .setText(R.strings.closed)
                            .setColor(AppColors.of.whiteColor)
                            .build(context),
                      ),
                    ),
                  if (store.vouchers.isNotEmpty) _promotionTag(context),
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
                            .setTextStyle(AppTextStyleExt.of.textBody2s)
                            .setMaxLines(1)
                            .setTextOverFlow(TextOverflow.ellipsis)
                            .build(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(1 / 2),
                        ),
                        AppTextCaption1Widget()
                            .setText(store.address)
                            .setColor(AppColors.of.grayColor[700])
                            .setMaxLines(2)
                            .setTextOverFlow(TextOverflow.ellipsis)
                            .build(context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _rating(context),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            .setText(store.reviewStatistic?.averagePoint.toString())
            .build(context),
      ],
    );
  }
}
