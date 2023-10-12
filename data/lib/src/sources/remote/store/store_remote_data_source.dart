part of '../base_remote_data_source.dart';

abstract class StoreRemoteDataSource {
  Future<AppPaginationListResultRaw<StoreRaw>> getStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<StoreRaw>> searchStores({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<MenuRaw>> getStoreMenu({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<StoreRaw>> getStoreDetail({
    required Map<String, dynamic> params,
  });
}

class StoreRemoteDataSourceImpl extends StoreRemoteDataSource {
  final NetworkService _networkService;

  StoreRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppPaginationListResultRaw<StoreRaw>> getStoreList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.stores,
          method: HttpMethod.get,
          queryParameters: params,
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
  Future<AppPaginationListResultRaw<StoreRaw>> searchStores({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.searchStores,
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
  Future<AppObjectResultRaw<MenuRaw>> getStoreMenu({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.stores}/${params['storeId']}/menu',
          method: HttpMethod.get,
        ),
      );

      return remoteData.toObjectRaw((data) => MenuRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<StoreRaw>> getStoreDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.stores}/${params['storeId']}',
          method: HttpMethod.get,
        ),
      );

      return remoteData.toObjectRaw((data) => StoreRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
