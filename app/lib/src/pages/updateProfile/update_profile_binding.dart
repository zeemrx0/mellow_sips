part of './update_profile_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
