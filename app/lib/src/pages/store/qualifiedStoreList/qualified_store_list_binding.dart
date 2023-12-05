part of 'qualified_store_list_controller.dart';

class QualifiedStoreListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QualifiedStoreListController>(() => QualifiedStoreListController(Get.find(), Get.find()));
  }
}
