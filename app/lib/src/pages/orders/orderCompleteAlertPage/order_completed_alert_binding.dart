part of './order_completed_alert_controller.dart';

class OrderCompletedAlertBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderCompletedAlertController>(
        () => OrderCompletedAlertController());
  }
}
