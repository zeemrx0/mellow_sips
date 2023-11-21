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
                      children: controller.carts
                          .map(
                            (cart) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextHeading6Widget()
                                        .setText(cart.store.name)
                                        .setTextAlign(TextAlign.start)
                                        .setColor(AppColors.of.primaryColor)
                                        .build(
                                          context,
                                        ),
                                    AppIconButtonWidget()
                                        .setOnPressed(() {
                                          controller.deleteCart(cart.id);
                                        })
                                        .setPrefixIcon(
                                          R.svgs.icClose.svg(
                                            width: AppThemeExt.of.majorScale(5),
                                            height:
                                                AppThemeExt.of.majorScale(5),
                                          ),
                                        )
                                        .build(context),
                                  ],
                                ),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(4),
                                ),
                                ...cart.cartItems
                                    .map(
                                      (cartItem) => CartItemWidget(
                                        cartItem: cartItem,
                                        refreshCarts: () {
                                          controller.getAllCart();
                                        },
                                      ),
                                    )
                                    .toList(),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(2),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppTextHeading6Widget()
                                        .setText(R.strings.totalPrice)
                                        .build(context),
                                    AppTextHeading6Widget()
                                        .setText(
                                            '${NumberExt.withSeparator(controller.totalPrice(cart))}đ')
                                        .setColor(AppColors.of.primaryColor)
                                        .build(context),
                                  ],
                                ),
                                SizedBox(
                                  height: AppThemeExt.of.majorScale(4),
                                ),
                                AppFilledButtonWidget()
                                    .setButtonText(R.strings.order)
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
