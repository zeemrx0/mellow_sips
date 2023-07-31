import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          Container(
            child: Center(
              child: AppTextBody1Widget().setText('Xóa').build(context),
            ),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorPaddingScale(4),
          vertical: AppThemeExt.of.majorPaddingScale(4),
        ),
        margin: EdgeInsets.only(bottom: AppThemeExt.of.majorMarginScale(4)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(8)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.11),
              blurRadius: 16,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(5)),
              child: Image.network(
                cartItem.image,
                width: AppThemeExt.of.majorScale(84 / 4),
                height: AppThemeExt.of.majorScale(84 / 4),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(4),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextHeading6Widget()
                      .setText(cartItem.name)
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
                      .build(context),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(1),
                  ),
                  AppTextBody1Widget()
                      .setText(cartItem.description)
                      .build(context),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(6 / 4),
                  ),
                  AppTextHeading6Widget()
                      .setText('${cartItem.price}đ')
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
                      .setColor(AppColors.of.secondaryColor)
                      .build(context),
                ],
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(3),
            ),
            Row(
              children: [
                Container(
                  width: AppThemeExt.of.majorScale(6),
                  height: AppThemeExt.of.majorScale(6),
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: AppColors.of.secondaryColor[400],
                  ),
                  child: Center(
                    child: AppTextHeading6Widget()
                        .setText('-')
                        .setColor(Colors.white)
                        .build(context),
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(3),
                ),
                AppTextHeading5Widget()
                    .setText('${cartItem.quantity}')
                    .build(context),
                SizedBox(
                  width: AppThemeExt.of.majorScale(3),
                ),
                Container(
                  width: AppThemeExt.of.majorScale(6),
                  height: AppThemeExt.of.majorScale(6),
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: AppColors.of.secondaryColor[400],
                  ),
                  child: Center(
                    child: AppTextHeading6Widget()
                        .setText('+')
                        .setColor(Colors.white)
                        .build(context),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
