part of './order_detail_controller.dart';

class OrderDetailPage extends GetWidget<OrderDetailController> {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getOrderDetail();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SmartRefresher(
      controller: controller._refreshController,
      enablePullDown: true,
      onRefresh: () async {
        controller.getOrderDetail();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppThemeExt.of.majorScale(4),
        ),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  AppTextHeading3Widget()
                      .setText(controller.order.value?.details.store.name)
                      .build(context),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(2),
                  ),
                  AppTextHeading6Widget()
                      .setText(controller
                          .getOrderStatus(controller.order.value?.status))
                      .setColor(AppColors.of.subTextColor)
                      .build(context),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(2),
                  ),
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
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: AppThemeExt.of.majorScale(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (controller.order.value?.status ==
                        AppOrderStatus.pending)
                      AppFilledButtonWidget()
                          .setButtonText(R.strings.pay)
                          .setOnPressed(() {
                        controller.payOrder();
                      }).build(context),
                    if (controller.order.value?.status ==
                            AppOrderStatus.pending ||
                        controller.order.value?.status ==
                            AppOrderStatus.ordered)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: AppThemeExt.of.majorScale(2),
                          ),
                          AppOutlinedButtonWidget()
                              .setButtonText(R.strings.cancelOrder)
                              .setOnPressed(() {
                            controller.cancelOrder();
                          }).build(context),
                        ],
                      ),
                  ],
                ),
              ),
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
