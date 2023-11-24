part of './notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}