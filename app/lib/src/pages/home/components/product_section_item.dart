import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

class ProductSectionItem extends StatelessWidget {
  final ProductModel product;

  const ProductSectionItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.storeDetail,
          arguments: {
            AppConstants.storeId: product.storeId,
            AppConstants.productId: product.id,
            AppConstants.action: AppConstants.navigateToProduct,
          },
        );
      },
      child: Container(
        width: AppThemeExt.of.majorScale(132 / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppThemeExt.of.majorScale(2),
          ),
          color: AppColors.of.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: AppThemeExt.of.majorScale(4),
              offset: Offset(
                0,
                AppThemeExt.of.majorScale(1),
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DataImageWidget(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(2),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(2),
                ),
              ),
              imageData: product.coverImageData,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeExt.of.majorScale(2),
                vertical: AppThemeExt.of.majorScale(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextBody2Widget()
                      .setText(product.name)
                      .setTextStyle(AppTextStyleExt.of.textBody2s)
                      .setMaxLines(1)
                      .setTextOverFlow(TextOverflow.ellipsis)
                      .setColor(AppColors.of.primaryColor)
                      .build(context),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(1 / 2),
                  ),
                  AppTextCaption1Widget()
                      .setText(NumberExt.withSeparator(product.price!))
                      .setColor(AppColors.of.subTextColor)
                      .setTextOverFlow(TextOverflow.ellipsis)
                      .build(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
