part of './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCart();
    controller.getCartVouchers();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.order)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(true)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: AppThemeExt.of.majorScale(4),
            ),
            Container(
              color: AppColors.of.whiteColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeExt.of.majorPaddingScale(4),
                vertical: AppThemeExt.of.majorPaddingScale(3),
              ),
              child: Obx(
                () => OrderCartItemList(
                  cartItems: controller.cart.value?.cartItems ?? [],
                ),
              ),
            ),
            SizedBox(
              height: AppThemeExt.of.majorScale(4),
            ),
            Container(
              color: AppColors.of.whiteColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeExt.of.majorPaddingScale(4),
                vertical: AppThemeExt.of.majorPaddingScale(3),
              ),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextHeading6Widget()
                        .setText(
                            '${R.strings.subtotal} (${controller.cart.value?.numberOfItems ?? 0} ${R.strings.items})')
                        .build(context),
                    AppTextBody1Widget()
                        .setText(
                            '${NumberExt.withSeparator(controller.cart.value?.finalPrice ?? 0)}đ')
                        .build(context),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppThemeExt.of.majorScale(4),
            ),
            Container(
              color: AppColors.of.whiteColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeExt.of.majorPaddingScale(4),
                vertical: AppThemeExt.of.majorPaddingScale(3),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.vouchers,
                        arguments: {
                          CheckoutControllerKey.vouchers: controller
                                  .vouchers.value?.BUSINESS
                                  .where((voucher) => voucher.canUse)
                                  .toList() ??
                              [],
                          CheckoutControllerKey.chosenVoucher:
                              controller.businessVoucher.value,
                        },
                      )?.then((value) {
                        controller.businessVoucher.value =
                            value as VoucherModel?;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            R.svgs.icTag2.svg(
                              width: AppThemeExt.of.majorScale(4),
                              height: AppThemeExt.of.majorScale(4),
                              colorFilter: ColorFilter.mode(
                                AppColors.of.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(
                              width: AppThemeExt.of.majorScale(2),
                            ),
                            AppTextBody2Widget()
                                .setText(R.strings.storeVoucher)
                                .build(context),
                          ],
                        ),
                        R.svgs.icChevronRight.svg(
                          width: AppThemeExt.of.majorScale(4),
                          height: AppThemeExt.of.majorScale(4),
                          colorFilter: ColorFilter.mode(
                            AppColors.of.subTextColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(3),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: AppColors.of.dividerColor,
                  ),
                  SizedBox(
                    height: AppThemeExt.of.majorScale(3),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.vouchers, arguments: {
                        CheckoutControllerKey.vouchers: controller
                                .vouchers.value?.SYSTEM
                                .where((voucher) => voucher.canUse)
                                .toList() ??
                            [],
                        CheckoutControllerKey.chosenVoucher:
                            controller.systemVoucher.value,
                      })?.then((value) {
                        controller.systemVoucher.value = value as VoucherModel?;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            R.svgs.icTag2.svg(
                              width: AppThemeExt.of.majorScale(4),
                              height: AppThemeExt.of.majorScale(4),
                              colorFilter: ColorFilter.mode(
                                AppColors.of.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(
                              width: AppThemeExt.of.majorScale(2),
                            ),
                            AppTextBody2Widget()
                                .setText(R.strings.mellowSipsVoucher)
                                .build(context),
                          ],
                        ),
                        R.svgs.icChevronRight.svg(
                          width: AppThemeExt.of.majorScale(4),
                          height: AppThemeExt.of.majorScale(4),
                          colorFilter: ColorFilter.mode(
                            AppColors.of.subTextColor,
                            BlendMode.srcIn,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                              .setTextStyle(AppTextStyleExt.of.textBody1s)
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
                              CheckoutControllerKey.vouchers: [
                                controller.businessVoucher.value?.id,
                                controller.systemVoucher.value?.id,
                              ].where((element) => element != null).toList(),
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
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
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
                      .setTextStyle(AppTextStyleExt.of.textBody1s)
                      .build(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
