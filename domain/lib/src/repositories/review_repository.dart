part of './base_repository.dart';

abstract class ReviewRepository {
  Future<AppPaginationListResultModel<StoreReviewModel>> searchStoreReviews({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> createStoreReview({
    required Map<String, dynamic> params,
  });
}
