import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

class OrderCartItemList extends StatelessWidget {
  final List<CartItemModel> cartItems;

  const OrderCartItemList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItems
          .map(
            (cartItem) => _item(context, cartItem),
          )
          .toList(),
    );
  }

  Widget _item(BuildContext context, CartItemModel cartItem) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppThemeExt.of.majorScale(10 / 4),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.of.dividerColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppTextBody1Widget()
                  .setText('${cartItem.quantity}×')
                  .setTextStyle(
                    AppTextStyleExt.of.textBody1r?.copyWith(
                      fontFamily: R.fontFamily.workSans,
                    ),
                  )
                  .build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(2),
              ),
              Column(
                children: [
                  AppTextBody1Widget()
                      .setText(cartItem.product.name)
                      .setTextStyle(
                        AppTextStyleExt.of.textBody1r?.copyWith(
                          fontFamily: R.fontFamily.workSans,
                        ),
                      )
                      .build(context),
                ],
              ),
            ],
          ),
          Column(
            children: [
              if (cartItem.tempPrice != cartItem.finalPrice)
                AppTextBody2Widget()
                    .setText('${NumberExt.withSeparator(cartItem.tempPrice)}đ')
                    .setTextStyle(
                      AppTextStyleExt.of.textBody2r?.copyWith(
                        fontFamily: R.fontFamily.workSans,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                    .setColor(AppColors.of.subTextColor)
                    .build(context),
              AppTextBody1Widget()
                  .setText('${NumberExt.withSeparator(cartItem.finalPrice)}đ')
                  .setTextStyle(
                    AppTextStyleExt.of.textBody1r?.copyWith(
                      fontFamily: R.fontFamily.workSans,
                    ),
                  )
                  .build(context),
            ],
          ),
        ],
      ),
    );
  }
}
