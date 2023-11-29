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
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextBody2Widget()
                    .setText('${cartItem.quantity}×')
                    .build(context),
                SizedBox(
                  width: AppThemeExt.of.majorScale(3),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBody2Widget()
                          .setText(cartItem.product.name)
                          .build(context),
                      if (cartItem.addons.isNotEmpty)
                        Column(
                          children: [
                            SizedBox(
                              height: AppThemeExt.of.majorScale(1 / 2),
                            ),
                            AppTextCaption1Widget()
                                .setText(cartItem.addons
                                    .map((e) => e.name)
                                    .join(', '))
                                .setTextOverFlow(TextOverflow.ellipsis)
                                .setColor(AppColors.of.subTextColor)
                                .build(context),
                          ],
                        ),
                      if (cartItem.note.isNotEmpty)
                        Column(
                          children: [
                            SizedBox(
                              height: AppThemeExt.of.majorScale(1 / 2),
                            ),
                            AppTextCaption1Widget()
                                .setText('${R.strings.note}: ${cartItem.note}')
                                .setTextOverFlow(TextOverflow.ellipsis)
                                .setColor(AppColors.of.subTextColor)
                                .build(context),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppThemeExt.of.majorScale(4),
          ),
          Column(
            children: [
              if (cartItem.tempPrice != cartItem.finalPrice)
                AppTextCaption1Widget()
                    .setText('${NumberExt.withSeparator(cartItem.tempPrice)}đ')
                    .setTextStyle(
                      AppTextStyleExt.of.textCaption1r?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                    .setColor(AppColors.of.subTextColor)
                    .build(context),
              AppTextBody2Widget()
                  .setText('${NumberExt.withSeparator(cartItem.finalPrice)}đ')
                  .build(context),
            ],
          ),
        ],
      ),
    );
  }
}
