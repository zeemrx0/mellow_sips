part of './store_list_controller.dart';

class StoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreListController>(() => StoreListController(Get.find()));
  }
}
