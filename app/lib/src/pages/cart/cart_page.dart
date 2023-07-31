part of 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getCart();
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return CartItemWidget(cartItem: item);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextHeading1Widget().setText('Tổng đơn').build(context),
                AppTextHeading1Widget()
                    .setText('${controller.totalPrice()}đ')
                    .setColor(AppColors.of.primaryColor)
                    .build(context),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.of.primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
              onPressed: () {},
              child: AppTextHeading1Widget()
                  .setText('Thanh toán')
                  .setColor(Colors.white)
                  .build(context),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: AppTextHeading3Widget()
          .setText(R.strings.cart)
          .setColor(AppColors.of.orangeColor)
          .build(context),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
    );
  }
}
