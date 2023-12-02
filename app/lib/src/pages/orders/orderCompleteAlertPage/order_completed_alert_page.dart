part of './order_completed_alert_controller.dart';

class OrderCompletedAlertPage extends GetView<OrderCompletedAlertController> {
  const OrderCompletedAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.alert();
    controller.getOrderDetail(Get.arguments as String);

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppThemeExt.of.majorPaddingScale(4),
          left: AppThemeExt.of.majorPaddingScale(4),
          right: AppThemeExt.of.majorPaddingScale(4),
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextHeading5Widget()
                  .setText(R.strings.yourOrderHasBeenCompleted)
                  .setTextAlign(TextAlign.center)
                  .build(context),
              SizedBox(
                height: AppThemeExt.of.majorScale(6),
              ),
              AppTextBody1Widget()
                  .setText(controller.order.value?.details.store.name ??
                      R.strings.orderDetails)
                  .setTextStyle(AppTextStyleExt.of.textBody2s)
                  .build(context),
              OrderCartItemList(
                cartItems: controller.order.value?.details.cartItems ?? [],
              ),
              SizedBox(
                height: AppThemeExt.of.majorScale(4),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBody2Widget()
                      .setText(
                          '${R.strings.subtotal} (${controller.order.value?.details.cartItems.length ?? 0} ${R.strings.items})')
                      .setTextStyle(AppTextStyleExt.of.textBody2s)
                      .build(context),
                  AppTextBody2Widget()
                      .setText(
                          '${NumberExt.withSeparator(controller.order.value?.finalPrice ?? 0)}đ')
                      .build(context),
                ],
              ),
              if (controller.businessVoucherOrder.value != null)
                Column(
                  children: [
                    SizedBox(
                      height: AppThemeExt.of.majorScale(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextBody2Widget()
                            .setText(R.strings.storeVoucher)
                            .setTextStyle(AppTextStyleExt.of.textBody2s)
                            .build(context),
                        AppTextBody2Widget()
                            .setText(
                                '-${NumberExt.withSeparator(controller.businessVoucherOrder.value!.discountAmount)}đ')
                            .build(context),
                      ],
                    ),
                  ],
                ),
              if (controller.systemVoucherOrder.value != null)
                Column(
                  children: [
                    SizedBox(
                      height: AppThemeExt.of.majorScale(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextBody2Widget()
                            .setText(R.strings.mellowSipsVoucher)
                            .setTextStyle(AppTextStyleExt.of.textBody2s)
                            .build(context),
                        AppTextBody2Widget()
                            .setText(
                                '-${NumberExt.withSeparator(controller.systemVoucherOrder.value!.discountAmount)}đ')
                            .build(context),
                      ],
                    ),
                  ],
                ),
              SizedBox(
                height: AppThemeExt.of.majorScale(4),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextBody2Widget()
                      .setText(R.strings.totalPrice)
                      .setTextStyle(AppTextStyleExt.of.textBody2s)
                      .build(context),
                  AppTextBody2Widget()
                      .setText(
                          '${NumberExt.withSeparator(controller.order.value?.finalPrice ?? 0)}đ')
                      .build(context),
                ],
              ),
              SizedBox(
                height: AppThemeExt.of.majorScale(6),
              ),
              if (controller.isAlerting.value)
                AppFilledButtonWidget()
                    .setButtonText(R.strings.confirm)
                    .setOnPressed(
                  () {
                    controller.stopAlert();
                  },
                ).build(context),
              if (!controller.isAlerting.value)
                AppOutlinedButtonWidget()
                    .setButtonText(R.strings.back)
                    .setOnPressed(
                  () {
                    Get.back();
                  },
                ).build(context),
            ],
          ),
        ),
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
