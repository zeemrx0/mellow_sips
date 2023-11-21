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
  final String? selectedOptionId;

  const VoucherWidget({
    super.key,
    required this.voucher,
    this.selectedOptionId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back(
          result: voucher,
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          right: AppThemeExt.of.majorScale(2),
        ),
        decoration: BoxDecoration(
          color: AppColors.of.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.of.blackColor.withOpacity(0.1),
              blurRadius: AppThemeExt.of.majorScale(4),
              offset: Offset(
                0,
                AppThemeExt.of.majorScale(1 / 2),
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(
            AppThemeExt.of.majorScale(3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: AppThemeExt.of.majorScale(22),
              height: AppThemeExt.of.majorScale(22),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.of.primaryColor[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    AppThemeExt.of.majorScale(3),
                  ),
                  bottomLeft: Radius.circular(
                    AppThemeExt.of.majorScale(3),
                  ),
                ),
              ),
              child: R.svgs.logo.svg(
                width: AppThemeExt.of.majorScale(10),
                height: AppThemeExt.of.majorScale(10),
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(3),
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
            Radio(
              activeColor: AppColors.of.primaryColor,
              splashRadius: AppThemeExt.of.majorScale(1),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: voucher.id,
              groupValue: selectedOptionId,
              onChanged: (value) {},
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
          .setTextStyle(AppTextStyleExt.of.textBody1s)
          .build(context);
    }
    return AppTextBody1Widget()
        .setText('${R.strings.discount} ${voucher.value}%')
        .setTextStyle(AppTextStyleExt.of.textBody1s)
        .build(context);
  }
}
