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
                      .setText(
                        controller
                            .getOrderStatus(controller.order.value?.status),
                      )
                      .setColor(
                        controller.getOrderStatusColor(
                            controller.order.value?.status),
                      )
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
                              '${NumberExt.withSeparator(controller.order.value?.details.tempPrice ?? 0)}đ')
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
                    height: AppThemeExt.of.majorScale(2),
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
                  _reviewSection(context),
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

  Widget _reviewSection(BuildContext context) {
    if (controller.order.value?.status != AppOrderStatus.received) {
      return const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.only(
        top: AppThemeExt.of.majorScale(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextHeading5Widget()
              .setText(R.strings.howDoYouRateThisOrder)
              .setTextAlign(TextAlign.center)
              .build(context),
          SizedBox(
            height: AppThemeExt.of.majorScale(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIconButtonWidget()
                  .setPrefixIcon(
                (controller.stars.value ?? -1) >= 1
                    ? R.svgs.icStarYellow.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      )
                    : R.svgs.icStarOutline.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      ),
              )
                  .setOnPressed(
                () {
                  controller.stars.value = 1;
                },
              ).build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(2),
              ),
              AppIconButtonWidget()
                  .setPrefixIcon(
                (controller.stars.value ?? -1) >= 2
                    ? R.svgs.icStarYellow.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      )
                    : R.svgs.icStarOutline.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      ),
              )
                  .setOnPressed(
                () {
                  controller.stars.value = 2;
                },
              ).build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(2),
              ),
              AppIconButtonWidget()
                  .setPrefixIcon(
                (controller.stars.value ?? -1) >= 3
                    ? R.svgs.icStarYellow.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      )
                    : R.svgs.icStarOutline.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      ),
              )
                  .setOnPressed(
                () {
                  controller.stars.value = 3;
                },
              ).build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(2),
              ),
              AppIconButtonWidget()
                  .setPrefixIcon(
                (controller.stars.value ?? -1) >= 4
                    ? R.svgs.icStarYellow.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      )
                    : R.svgs.icStarOutline.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      ),
              )
                  .setOnPressed(
                () {
                  controller.stars.value = 4;
                },
              ).build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(2),
              ),
              AppIconButtonWidget()
                  .setPrefixIcon(
                (controller.stars.value ?? -1) >= 5
                    ? R.svgs.icStarYellow.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      )
                    : R.svgs.icStarOutline.svg(
                        width: AppThemeExt.of.majorScale(8),
                        height: AppThemeExt.of.majorScale(8),
                      ),
              )
                  .setOnPressed(
                () {
                  controller.stars.value = 5;
                },
              ).build(context),
            ],
          ),
          SizedBox(
            height: AppThemeExt.of.majorScale(4),
          ),
          AppFilledButtonWidget()
              .setButtonText(R.strings.sendReview)
              .setOnPressed(
            () {
              controller.sendReview();
            },
          ).build(context),
        ],
      ),
    );
  }
}
