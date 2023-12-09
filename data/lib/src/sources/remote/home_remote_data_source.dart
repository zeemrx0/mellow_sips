part of './base_remote_data_source.dart';

abstract class HomeRemoteDataSource {
  Future<AppPaginationListResultRaw<StoreRaw>> getCoffeeStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<StoreRaw>> getMilkTeaStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<StoreRaw>> getPromotingStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<StoreRaw>> getQualifiedStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<ProductRaw>> getBestSellingProducts({
    required Map<String, dynamic> params,
  });
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final NetworkService _networkService;

  HomeRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppPaginationListResultRaw<StoreRaw>> getCoffeeStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.customerDashboard}/coffee',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultRaw<StoreRaw>> getMilkTeaStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.customerDashboard}/milk-tea',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultRaw<StoreRaw>> getPromotingStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.customerDashboard}/hot-deals',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultRaw<StoreRaw>> getQualifiedStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.customerDashboard}/quality-stores',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultRaw<ProductRaw>> getBestSellingProducts({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.customerDashboard}/favorite',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return remoteData.toPaginationListRaw((data) =>
          (data as List).map((item) => ProductRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
