part of '../base_remote_data_source.dart';

abstract class StoreRemoteDataSource {
  Future<AppListResultRaw<StoreRaw>> getStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppListResultRaw<StoreRaw>> searchStores({
    required Map<String, dynamic> params,
  });
}

class StoreRemoteDataSourceImpl extends StoreRemoteDataSource {
  final NetworkService _networkService;

  StoreRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppListResultRaw<StoreRaw>> getStoreList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.stores,
          method: HttpMethod.get,
          queryParameters: params,
          isRequestedForList: true,
        ),
      );

      return remoteData.toListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppListResultRaw<StoreRaw>> searchStores({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.searchStores,
          method: HttpMethod.post,
          body: params,
          isRequestedForList: true,
        ),
      );

      return remoteData.toListRaw((data) =>
          (data as List).map((item) => StoreRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
