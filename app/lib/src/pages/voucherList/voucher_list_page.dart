part of './voucher_list_controller.dart';

class VoucherListPage extends GetView<VoucherListController> {
  const VoucherListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.getVouchers();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorPaddingScale(4),
            vertical: AppThemeExt.of.majorPaddingScale(2),
          ),
          child: FormBuilder(
            key: controller.formKey,
            child: Row(
              children: [
                Expanded(
                    child: AppTextFieldWidget()
                        .setFieldKey('voucherCode')
                        .build(context)),
                SizedBox(
                  width: AppThemeExt.of.majorScale(2),
                ),
                InkWell(
                  onTap: () async {
                    controller.formKey.currentState?.save();

                    await controller.applyVoucher();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      AppThemeExt.of.majorScale(10 / 4),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.of.primaryColor,
                      borderRadius: BorderRadius.circular(
                        AppThemeExt.of.majorScale(10 / 4),
                      ),
                    ),
                    child: R.svgs.icChevronRight.svg(
                      width: AppThemeExt.of.majorScale(22 / 4),
                      height: AppThemeExt.of.majorScale(22 / 4),
                      colorFilter: ColorFilter.mode(
                        AppColors.of.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(2),
        ),
        AppTextCaption1Widget()
            .setText(R.strings.orChooseVouchersBelow)
            .setColor(AppColors.of.subTextColor)
            .build(context),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorPaddingScale(4),
              horizontal: AppThemeExt.of.majorPaddingScale(4),
            ),
            child: Column(
              children: controller.vouchers.value.map(
                (voucher) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppThemeExt.of.majorPaddingScale(3),
                    ),
                    child: VoucherWidget(
                      voucher: voucher,
                      selectedOptionId: (Get.arguments[VoucherListControllerKey
                              .selectedVoucher] as VoucherModel?)
                          ?.id,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.chooseVoucher)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(true)
        .build(context);
  }
}
