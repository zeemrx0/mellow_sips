part of 'coffee_store_list_controller.dart';

class CoffeeStoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoffeeStoreListController>(() => CoffeeStoreListController(Get.find(), Get.find()));
  }
}
