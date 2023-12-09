part of 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCart(
      Get.arguments[AppConstants.cartId] as String,
    );

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
              vertical: AppThemeExt.of.majorScale(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorScale(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextHeading6Widget()
                                .setText(controller.cart.value?.store.name)
                                .setTextAlign(TextAlign.start)
                                .setColor(AppColors.of.primaryColor)
                                .build(
                                  context,
                                ),
                            AppIconButtonWidget()
                                .setOnPressed(
                                  () {
                                    if (controller.cart.value != null) {
                                      controller.deleteCart(
                                          controller.cart.value!.id);
                                    }
                                  },
                                )
                                .setPrefixIcon(
                                  R.svgs.icClose.svg(
                                    width: AppThemeExt.of.majorScale(5),
                                    height: AppThemeExt.of.majorScale(5),
                                  ),
                                )
                                .build(context),
                          ],
                        ),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(4),
                        ),
                        ...(controller.cart.value?.cartItems ?? [])
                            .map(
                              (cartItem) => CartItemWidget(
                                cartItem: cartItem,
                                refreshCarts: () {
                                  controller.getCart(
                                    Get.arguments[AppConstants.cartId]
                                        as String,
                                  );
                                },
                              ),
                            )
                            .toList(),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextHeading6Widget()
                                .setText(R.strings.totalPrice)
                                .build(context),
                            AppTextHeading6Widget()
                                .setText(
                                    '${controller.cart.value != null ? NumberExt.withSeparator(controller.totalPrice(controller.cart.value!)) : 0}đ')
                                .setColor(AppColors.of.primaryColor)
                                .build(context),
                          ],
                        ),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),
                        AppFilledButtonWidget()
                            .setButtonText(R.strings.order)
                            .setOnPressed(() {
                          Get.toNamed(
                            Routes.checkout,
                            arguments: controller.cart.value?.id,
                          );
                        }).build(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.cart)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }
}
