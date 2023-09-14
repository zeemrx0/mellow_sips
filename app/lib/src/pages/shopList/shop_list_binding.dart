part of './shop_list_controller.dart';

class ShopListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopListController>(() => ShopListController(Get.find()));
  }
}
