part of './store_detail_controller.dart';

class StoreDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailController>(() => StoreDetailController());
  }
}
