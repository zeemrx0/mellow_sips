part of './order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderListController>(
      () => OrderListController(),
    );
    Get.lazyPut<WaitingForConfirmOrderListController>(
      () => WaitingForConfirmOrderListController(
        Get.find(),
      ),
    );
    Get.lazyPut<PreparingOrderListController>(
      () => PreparingOrderListController(
        Get.find(),
      ),
    );
    Get.lazyPut<CompletedOrderListController>(
      () => CompletedOrderListController(
        Get.find(),
      ),
    );
    Get.lazyPut<ReceivedOrderListController>(
      () => ReceivedOrderListController(
        Get.find(),
      ),
    );
    Get.lazyPut<CancelledOrderListController>(
      () => CancelledOrderListController(
        Get.find(),
      ),
    );
  }
}
