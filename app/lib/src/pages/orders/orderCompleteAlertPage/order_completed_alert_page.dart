part of './order_completed_alert_controller.dart';

class OrderCompletedAlertPage extends GetView<OrderCompletedAlertController> {
  const OrderCompletedAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.alert();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextHeading4Widget()
              .setText('Đơn hàng của bạn đã hoàn thành')
              .setTextAlign(TextAlign.center)
              .build(context),
          Padding(
            padding: EdgeInsets.only(
              top: AppThemeExt.of.majorPaddingScale(4),
              left: AppThemeExt.of.majorPaddingScale(4),
              right: AppThemeExt.of.majorPaddingScale(4),
            ),
            child: AppFilledButtonWidget()
                .setButtonText(R.strings.confirm)
                .setOnPressed(() {
                  controller.stopAlert();
                })
                .build(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(true)
        .build(context);
  }
}
