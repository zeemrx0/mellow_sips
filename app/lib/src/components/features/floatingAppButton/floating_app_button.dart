import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

class FloatingAppButton extends StatelessWidget {
  const FloatingAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppIconButtonWidget()
        .setOnPressed(
          () {
            Get.toNamed(Routes.qrScan);
          },
        )
        .setBackgroundColor(AppColors.of.primaryColor)
        .setPadding(
          EdgeInsets.all(
            AppThemeExt.of.majorScale(2),
          ),
        )
        .setBorderRadius(
          BorderRadius.circular(
            AppThemeExt.of.majorScale(100),
          ),
        )
        .setPrefixIcon(
          R.svgs.icQrCode.svg(
            width: AppThemeExt.of.majorScale(10),
            height: AppThemeExt.of.majorScale(10),
            colorFilter: ColorFilter.mode(
              AppColors.of.whiteColor,
              BlendMode.srcIn,
            ),
          ),
        )
        .build(context);
  }
}
