part of './cart_list_controller.dart';

class CartListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartListController>(
      () => CartListController(
        Get.find(),
        Get.find(),
      ),
    );
  }
}
