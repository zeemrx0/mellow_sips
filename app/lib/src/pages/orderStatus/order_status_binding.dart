part of 'order_status_controller.dart';

class OrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusController>(() => OrderStatusController(Get.find()));
  }
}
