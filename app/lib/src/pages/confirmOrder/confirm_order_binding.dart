part of 'confirm_order_controller.dart';

class ConfirmOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmOrderController>(
      () => ConfirmOrderController(
        Get.find(),
      ),
    );
  }
}
