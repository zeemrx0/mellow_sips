part of './checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
