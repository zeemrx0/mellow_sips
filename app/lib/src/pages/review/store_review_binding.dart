part of './store_review_controller.dart';

class StoreReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreReviewController>(
      () => StoreReviewController(
        Get.find(),
      ),
    );
  }
}
