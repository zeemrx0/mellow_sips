part of './product_detail_controller.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
        () => ProductDetailController(Get.find(), Get.find()));
  }
}
