import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewRemoteDataSource _reviewRemoteDataSource;

  ReviewRepositoryImpl(this._reviewRemoteDataSource);

  @override
  Future<AppPaginationListResultModel<StoreReviewModel>> searchStoreReviews({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _reviewRemoteDataSource.searchStoreReviews(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> createStoreReview({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _reviewRemoteDataSource.createStoreReview(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
