part of 'shop_detail_controller.dart';

class ShopDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopDetailController>(() => ShopDetailController());
  }
}
