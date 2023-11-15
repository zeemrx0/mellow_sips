part of 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAllCart();

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorScale(4),
                    ),
                    child: Column(
                      children: controller.carts
                          .map(
                            (cart) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextHeading5Widget()
                                        .setText(cart.store.name)
                                        .setTextAlign(TextAlign.start)
                                        .build(
                                          context,
                                        ),
                                    InkWell(
                                      onTap: () {
                                        controller.deleteCart(cart.id);
                                      },
                                      child: R.svgs.icClose.svg(
                                        width: AppThemeExt.of.majorScale(6),
                                        height: AppThemeExt.of.majorScale(6),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(4),
                                ),
                                ...cart.cartItems
                                    .map(
                                      (cartItem) => CartItemWidget(
                                        cartItem: cartItem,
                                      ),
                                    )
                                    .toList(),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(3),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextHeading5Widget()
                                        .setText(R.strings.totalPrice)
                                        .build(context),
                                    AppTextHeading5Widget()
                                        .setText(
                                            '${NumberExt.withSeparator(controller.totalPrice(cart))}đ')
                                        .setColor(AppColors.of.primaryColor)
                                        .build(context),
                                  ],
                                ),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(6),
                                ),
                                AppFilledButtonWidget()
                                    .setButtonText(R.strings.pay)
                                    .setOnPressed(() {
                                  Get.toNamed(Routes.checkout,
                                      arguments: cart.id);
                                }).build(context),
                              ],
                            ),
                          )
                          .toList(),
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
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.cart)
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
}
