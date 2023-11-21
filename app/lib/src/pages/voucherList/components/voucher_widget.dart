import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

class VoucherWidget extends StatelessWidget {
  final VoucherModel voucher;

  const VoucherWidget({super.key, required this.voucher});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back(
          result: voucher,
        );
      },
      child: Container(
        color: AppColors.of.whiteColor,
        child: Row(
          children: [
            Container(
              width: AppThemeExt.of.majorScale(20),
              height: AppThemeExt.of.majorScale(20),
              alignment: Alignment.center,
              child: R.pngs.appIcon.image(
                width: AppThemeExt.of.majorScale(10),
                height: AppThemeExt.of.majorScale(10),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _valueText(context),
                  if (voucher.minOrderAmount != null)
                    Column(
                      children: [
                        SizedBox(
                          height: AppThemeExt.of.majorScale(1),
                        ),
                        AppTextCaption1Widget()
                            .setText(
                                '${R.strings.minimum} ${NumberExt.withSeparator(voucher.minOrderAmount!)}đ')
                            .build(context),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _valueText(BuildContext context) {
    if (voucher.discountType == AppConstants.cash) {
      return AppTextBody1Widget()
          .setText(
              '${R.strings.discount} ${NumberExt.withSeparator(voucher.value)}đ')
          .build(context);
    }
    return AppTextBody1Widget()
        .setText('${R.strings.discount} ${voucher.value}%')
        .build(context);
  }
}
