part of '../base_use_case.dart';

abstract class CreateStoreReviewUseCase
    extends BaseUseCase<CreateStoreReviewParam, EmptyModel> {}

class CreateStoreReviewUseCaseImpl extends CreateStoreReviewUseCase {
  final ReviewRepository _reviewRepository;

  CreateStoreReviewUseCaseImpl(this._reviewRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    CreateStoreReviewParam? param,
  }) =>
      _reviewRepository.createStoreReview(
        params: param!.toJson(),
      );
}
