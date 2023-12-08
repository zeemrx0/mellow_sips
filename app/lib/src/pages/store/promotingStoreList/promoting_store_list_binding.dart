part of 'promoting_store_list_controller.dart';

class PromotingStoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotingStoreListController>(() => PromotingStoreListController(Get.find(), Get.find()));
  }
}
