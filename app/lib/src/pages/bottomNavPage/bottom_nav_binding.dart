part of './bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppBottomNavigationBarController>(
      () => AppBottomNavigationBarController(),
    );

    Get.lazyPut<BottomNavController>(
      () => BottomNavController(
        Get.find(),
        Get.find(),
      ),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );

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

    Get.lazyPut<NotificationController>(
      () => NotificationController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );

    Get.lazyPut<AppNavMenuController>(
      () => AppNavMenuController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
