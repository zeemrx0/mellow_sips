part of './order_detail_controller.dart';

class OrderDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(
      () => OrderDetailController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
