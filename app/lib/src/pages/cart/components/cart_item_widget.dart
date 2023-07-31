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
              child: AppTextBody1Widget()
                  .setText('Xóa')
                  .build(context),
            ),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
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
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                cartItem.image,
                width: 84,
                height: 84,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextBody1Widget()
                      .setText(cartItem.name)
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
                      .build(context),
                  AppTextBody1Widget()
                      .setText(cartItem.description)
                      .build(context),
                  AppTextBody1Widget()
                      .setText('${cartItem.price}đ')
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
                      .setColor(AppColors.of.secondaryColor)
                      .build(context),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: AppColors.of.secondaryColor[400],
                  ),
                  child: Center(
                    child: AppTextBody1Widget()
                        .setText('-')
                        .setColor(Colors.white)
                        .build(context),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                AppTextBody1Widget()
                    .setText('${cartItem.quantity}')
                    .build(context),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: AppColors.of.secondaryColor[400],
                  ),
                  child: Center(
                    child: AppTextBody1Widget()
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
