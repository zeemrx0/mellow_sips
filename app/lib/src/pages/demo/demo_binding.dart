part of 'demo_controller.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(() => DemoController(Get.find(), Get.find(), Get.find()));
  }
}
