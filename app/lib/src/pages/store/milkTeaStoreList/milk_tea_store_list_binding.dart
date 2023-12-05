part of 'milk_tea_store_list_controller.dart';

class MilkTeaStoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MilkTeaStoreListController>(() => MilkTeaStoreListController(Get.find(), Get.find()));
  }
}
