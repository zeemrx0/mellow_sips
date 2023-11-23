part of 'app_nav_menu_controller.dart';

class AppNavMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppNavMenuController>(
      () => AppNavMenuController(
        Get.find(),
      ),
    );
  }
}
