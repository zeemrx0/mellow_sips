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
            child: Column(
              children: controller.vouchers.value.map(
                (voucher) {
                  return VoucherWidget(
                    voucher: voucher,
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
