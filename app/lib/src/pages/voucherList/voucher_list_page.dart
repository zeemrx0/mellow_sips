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
        .setLeading(
          AppIconButtonWidget()
              .setPrefixIcon(
            R.svgs.icLongArrowLeft.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            ),
          )
              .setOnPressed(
            () {
              Get.back(
                result: Get.arguments[VoucherListControllerKey.selectedVoucher]
                    as VoucherModel?,
              );
            },
          ).build(context),
        )
        .build(context);
  }
}
