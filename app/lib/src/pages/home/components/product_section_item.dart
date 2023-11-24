import 'package:app/src/components/main/dataImage/data_image_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
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
          Routes.productDetail,
          arguments: product.id,
        );
      },
      child: SizedBox(
        width: AppThemeExt.of.majorScale(132 / 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DataImageWidget(
              borderRadius: BorderRadius.circular(
                AppThemeExt.of.majorScale(2),
              ),
              imageData: product.coverImageData,
            ),
            SizedBox(
              height: AppThemeExt.of.majorScale(1),
            ),
            Row(
              children: [
                AppTextBody2Widget()
                    .setText(product.name)
                    .setTextStyle(AppTextStyleExt.of.textBody2s)
                    .setColor(AppColors.of.primaryColor)
                    .build(context),
              ],
            ),
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
      ),
    );
  }
}
