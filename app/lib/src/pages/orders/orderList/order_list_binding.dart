part of './order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderListController>(
      () => OrderListController(
        Get.find(),
      ),
    );
  }
}
