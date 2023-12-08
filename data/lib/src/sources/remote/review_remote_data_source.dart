part of './base_remote_data_source.dart';

abstract class ReviewRemoteDataSource {
  Future<AppPaginationListResultRaw<StoreReviewRaw>> searchStoreReviews({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<EmptyRaw>> createStoreReview({
    required Map<String, dynamic> params,
  });
}

class ReviewRemoteDataSourceImpl extends ReviewRemoteDataSource {
  final NetworkService _networkService;

  ReviewRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<EmptyRaw>> createStoreReview({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.reviews,
          method: HttpMethod.post,
          body: params,
        ),
      );

      return remoteData.toObjectRaw((data) => EmptyRaw());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultRaw<StoreReviewRaw>> searchStoreReviews({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.stores}/${params['storeId']}/reviews/search',
          method: HttpMethod.post,
          requestType: RequestType.paginationList,
          body: params,
        ),
      );

      return remoteData.toPaginationListRaw(
        (data) => (data as List)
            .map(
              (item) => StoreReviewRaw.fromJson(item),
            )
            .toList(),
      );
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
