part of './search_store_controller.dart';

class SearchStoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStoreController>(
      () => SearchStoreController(
        Get.find<SearchStoresUseCase>(),
      ),
    );
  }
}
