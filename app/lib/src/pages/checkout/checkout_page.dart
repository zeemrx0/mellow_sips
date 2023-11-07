part of './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCart();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.order)
              .setTextStyle(
                AppTextStyleExt.of.textBody1s?.copyWith(
                  fontFamily: R.fontFamily.workSans,
                ),
              )
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextHeading6Widget()
                        .setText(
                            'Tạm tính (${controller.cart.value?.numberOfItems ?? 0} phần)')
                        .build(context),
                    AppTextBody1Widget()
                        .setText(
                            '${NumberExt.withSeparator(controller.cart.value?.finalPrice ?? 0)}đ')
                        .setTextStyle(
                          AppTextStyleExt.of.textBody1r?.copyWith(
                            fontFamily: R.fontFamily.workSans,
                          ),
                        )
                        .build(context),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.of.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.of.grayColor[950]!.withOpacity(0.1),
                  blurRadius: AppThemeExt.of.majorScale(4),
                  offset: Offset(
                    0,
                    -1 * AppThemeExt.of.majorScale(1),
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
              ),
            ),
            padding: EdgeInsets.only(
              left: AppThemeExt.of.majorPaddingScale(4),
              right: AppThemeExt.of.majorPaddingScale(4),
              top: AppThemeExt.of.majorPaddingScale(4),
              bottom: AppThemeExt.of.majorPaddingScale(2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextCaption1Widget()
                        .setText(R.strings.paymentMethod)
                        .build(context),
                    _paymentMethodSelectionInput(context),
                  ],
                ),
                SizedBox(
                  height: AppThemeExt.of.majorScale(4),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.of.dividerColor,
                ),
                SizedBox(
                  height: AppThemeExt.of.majorScale(4),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextCaption1Widget()
                            .setText(R.strings.totalPrice)
                            .build(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(1),
                        ),
                        Obx(
                          () => AppTextBody1Widget()
                              .setText(
                                  '${NumberExt.withSeparator(controller.cart.value?.finalPrice ?? 0)}đ')
                              .setTextStyle(
                                AppTextStyleExt.of.textBody1s?.copyWith(
                                  fontFamily: R.fontFamily.workSans,
                                ),
                              )
                              .build(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: AppThemeExt.of.majorScale(10),
                    ),
                    Expanded(
                      child: AppFilledButtonWidget()
                          .setButtonText(R.strings.order)
                          .setOnPressed(
                        () {
                          Get.toNamed(
                            Routes.confirmOrder,
                            arguments: {
                              CheckoutControllerKey.cartId:
                                  controller.cart.value?.id,
                              CheckoutControllerKey.initialTransactionMethod:
                                  controller.transactionMethod.value,
                            },
                          );
                        },
                      ).build(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _paymentMethodSelectionInput(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton2(
          value: controller.transactionMethod.value,
          onChanged: (value) {
            controller.transactionMethod.value = value as String;
          },
          items: [
            DropdownMenuItem(
              value: AppPaymentMethod.zalopay,
              child: Row(
                children: [
                  R.pngs.zaloPay.image(
                    width: AppThemeExt.of.majorScale(5),
                    height: AppThemeExt.of.majorScale(5),
                  ),
                  SizedBox(
                    width: AppThemeExt.of.majorScale(1),
                  ),
                  AppTextBody2Widget()
                      .setText(R.strings.zaloPay)
                      .setTextStyle(
                        AppTextStyleExt.of.textBody1s?.copyWith(
                          fontFamily: R.fontFamily.workSans,
                        ),
                      )
                      .build(context),
                ],
              ),
            ),
            DropdownMenuItem(
              value: AppPaymentMethod.cash,
              child: Row(
                children: [
                  R.svgs.icCash.svg(
                    width: AppThemeExt.of.majorScale(5),
                    height: AppThemeExt.of.majorScale(5),
                  ),
                  SizedBox(
                    width: AppThemeExt.of.majorScale(1),
                  ),
                  AppTextBody2Widget()
                      .setText(R.strings.cash)
                      .setTextStyle(
                        AppTextStyleExt.of.textBody1s?.copyWith(
                          fontFamily: R.fontFamily.workSans,
                        ),
                      )
                      .build(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return InkWell(
    //   child: Row(
    //     children: [
    //       R.pngs.zaloPay.image(
    //         width: AppThemeExt.of.majorScale(5),
    //         height: AppThemeExt.of.majorScale(5),
    //       ),
    //       SizedBox(
    //         width: AppThemeExt.of.majorScale(1),
    //       ),
    //       AppTextBody2Widget()
    //           .setText(R.strings.zaloPay)
    //           .setTextStyle(
    //             AppTextStyleExt.of.textBody1s?.copyWith(
    //               fontFamily: R.fontFamily.workSans,
    //             ),
    //           )
    //           .build(context),
    //     ],
    //   ),
    // );
  }
}
