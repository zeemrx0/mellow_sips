part of './verify_registration_controller.dart';

class VerifyRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyRegistrationController>(
      () => VerifyRegistrationController(Get.find()),
    );
  }
}
