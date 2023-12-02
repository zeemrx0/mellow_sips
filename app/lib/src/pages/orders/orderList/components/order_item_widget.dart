import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.orderDetail, arguments: order.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(4),
          vertical: AppThemeExt.of.majorScale(3),
        ),
        margin: EdgeInsets.only(
          bottom: AppThemeExt.of.majorScale(2),
        ),
        color: AppColors.of.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextBody1Widget()
                    .setText(order.details.store.name)
                    .setTextStyle(AppTextStyleExt.of.textBody1s)
                    .build(context),
                SizedBox(
                  height: AppThemeExt.of.majorScale(2),
                ),
                Row(
                  children: [
                    AppTextBody1Widget()
                        .setText(NumberExt.withSeparator(order.finalPrice ?? 0))
                        .setColor(AppColors.of.subTextColor)
                        .build(context),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppThemeExt.of.majorScale(2),
                      ),
                      height: AppThemeExt.of.majorScale(1),
                      width: AppThemeExt.of.majorScale(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.of.grayColor[500],
                      ),
                    ),
                    AppTextBody1Widget()
                        .setText(
                            '${order.details.cartItems.length} ${R.strings.items}')
                        .setColor(AppColors.of.subTextColor)
                        .build(context),
                  ],
                ),
              ],
            ),
            R.svgs.icChevronRight.svg(
              width: AppThemeExt.of.majorScale(5),
              height: AppThemeExt.of.majorScale(5),
            ),
          ],
        ),
      ),
    );
  }
}
