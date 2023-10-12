part of 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAllCart();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(Colors.white)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Obx(
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
                            AppTextHeading5Widget()
                                .setText(cart.store.name)
                                .setTextAlign(TextAlign.start)
                                .build(
                                  context,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppThemeExt.of.majorScale(4),
            ),
            child: FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.of.primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorScale(5),
                    vertical: AppThemeExt.of.majorScale(9 / 4),
                  ),
                ),
              ),
              onPressed: () {},
              child: AppTextHeading4Widget()
                  .setText(R.strings.pay)
                  .setColor(Colors.white)
                  .build(context),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: AppTextHeading4Widget()
          .setText(R.strings.cart)
          .setColor(AppColors.of.orangeColor)
          .build(context),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: AppThemeExt.of.majorScale(6),
        ),
        onPressed: () => Get.back(),
      ),
    );
  }
}
