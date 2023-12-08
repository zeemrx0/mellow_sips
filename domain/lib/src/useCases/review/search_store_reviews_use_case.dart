part of '../base_use_case.dart';

abstract class SearchStoreReviewsUseCase
    extends BaseUseCase<SearchStoreReviewsParam, StoreReviewModel> {}

class SearchStoreReviewsUseCaseImpl extends SearchStoreReviewsUseCase {
  final ReviewRepository _reviewRepository;

  SearchStoreReviewsUseCaseImpl(this._reviewRepository);

  @override
  Future<AppPaginationListResultModel<StoreReviewModel>> executePaginationList({
    SearchStoreReviewsParam? param,
  }) {
    return _reviewRepository.searchStoreReviews(params: param!.toJson());
  }
}
