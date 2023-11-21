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
