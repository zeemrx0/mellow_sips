part of './change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
