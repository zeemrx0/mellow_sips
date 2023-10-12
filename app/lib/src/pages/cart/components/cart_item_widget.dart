import 'dart:convert';

import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/cart/cart_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

class CartItemWidget extends GetView<CartController> {
  final CartItemModel cartItem;

  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(cartItem.id),
      padding: EdgeInsets.only(bottom: AppThemeExt.of.majorMarginScale(4)),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 1 / 2,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorPaddingScale(4),
                  ),
                  margin: EdgeInsets.only(
                    left: AppThemeExt.of.majorPaddingScale(4),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.of.greenColor[50],
                    borderRadius: BorderRadius.circular(
                      AppThemeExt.of.majorScale(4),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: AppColors.of.greenColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.removeItem(cartItem.id);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorPaddingScale(4),
                  ),
                  margin: EdgeInsets.only(
                    left: AppThemeExt.of.majorPaddingScale(4),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.of.redColor[50],
                    borderRadius: BorderRadius.circular(
                      AppThemeExt.of.majorScale(4),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.of.redColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorPaddingScale(4),
            vertical: AppThemeExt.of.majorPaddingScale(4),
          ),
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
                borderRadius:
                    BorderRadius.circular(AppThemeExt.of.majorScale(5)),
                child: Image.memory(
                  base64Decode(cartItem.product.coverImageData ?? ''),
                  width: AppThemeExt.of.majorScale(72 / 4),
                  height: AppThemeExt.of.majorScale(72 / 4),
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
                    AppTextBody1Widget()
                        .setText(cartItem.product.name)
                        .setTextStyle(
                          AppTextStyleExt.of.textBody1s?.copyWith(
                            fontFamily: R.fontFamily.workSans,
                          ),
                        )
                        .build(context),
                    SizedBox(
                      height: AppThemeExt.of.majorScale(2 / 4),
                    ),
                    AppTextBody2Widget()
                        .setText(cartItem.product.description)
                        .setColor(AppColors.of.subTextColor)
                        .build(context),
                    SizedBox(
                      height: AppThemeExt.of.majorScale(6 / 4),
                    ),
                    AppTextHeading6Widget()
                        .setText(
                            '${NumberExt.withSeparator(cartItem.tempPrice)}đ')
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
                  InkWell(
                    onTap: () {
                      controller.decreaseQuantity(cartItem.id);
                    },
                    child: Container(
                      width: AppThemeExt.of.majorScale(6),
                      height: AppThemeExt.of.majorScale(6),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: AppColors.of.secondaryColor[400],
                      ),
                      child: Center(
                          child: Icon(
                        Icons.remove_rounded,
                        color: Colors.white,
                        size: AppThemeExt.of.majorScale(4),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: AppThemeExt.of.majorScale(3),
                  ),
                  AppTextHeading6Widget()
                      .setText('${cartItem.quantity}')
                      .build(context),
                  SizedBox(
                    width: AppThemeExt.of.majorScale(3),
                  ),
                  InkWell(
                    onTap: () {
                      controller.increaseQuantity(cartItem.id);
                    },
                    child: Container(
                      width: AppThemeExt.of.majorScale(6),
                      height: AppThemeExt.of.majorScale(6),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: AppColors.of.secondaryColor[400],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: AppThemeExt.of.majorScale(4),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
