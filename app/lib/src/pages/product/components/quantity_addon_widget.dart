import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:resources/resources.dart';

class QuantityAddonWidget extends StatelessWidget {
  final ProductAddonModel productAddon;
  final int quantity;
  final Function(String) deceaseQuantity;
  final Function(String) increaseQuantity;

  const QuantityAddonWidget({
    super.key,
    required this.productAddon,
    required this.quantity,
    required this.deceaseQuantity,
    required this.increaseQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppThemeExt.of.majorPaddingScale(2),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.of.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              deceaseQuantity(productAddon.id);
            },
            child: Container(
              padding: EdgeInsets.all(
                AppThemeExt.of.majorPaddingScale(1),
              ),
              decoration: BoxDecoration(
                color: AppColors.of.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppThemeExt.of.majorScale(1),
                ),
              ),
              child: R.svgs.icMinus.svg(
                width: AppThemeExt.of.majorScale(2),
                height: AppThemeExt.of.majorScale(2),
                colorFilter: ColorFilter.mode(
                  AppColors.of.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppThemeExt.of.majorScale(2),
          ),
          AppTextBody2Widget().setText('$quantity').build(context),
          SizedBox(
            width: AppThemeExt.of.majorScale(2),
          ),
          InkWell(
            onTap: () {
              increaseQuantity(productAddon.id);
            },
            child: Container(
              padding: EdgeInsets.all(
                AppThemeExt.of.majorPaddingScale(1),
              ),
              decoration: BoxDecoration(
                color: AppColors.of.primaryColor,
                borderRadius: BorderRadius.circular(
                  AppThemeExt.of.majorScale(1),
                ),
              ),
              child: R.svgs.icPlus.svg(
                width: AppThemeExt.of.majorScale(2),
                height: AppThemeExt.of.majorScale(2),
                colorFilter: ColorFilter.mode(
                  AppColors.of.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(
            width: AppThemeExt.of.majorScale(4),
          ),
          AppTextBody2Widget().setText(productAddon.name).build(context),
        ],
      ),
    );
  }
}
