part of '../base_remote_data_source.dart';

abstract class ShopRemoteDataSource {
  Future<AppListResultRaw<ShopRaw>> getShopList(
      {required Map<String, dynamic> params});
}

class ShopRemoteDataSourceImpl extends ShopRemoteDataSource {
  final NetworkService _networkService;

  ShopRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppListResultRaw<ShopRaw>> getShopList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.shops,
          method: HttpMethod.get,
          queryParameters: params,
          isRequestedForList: true,
        ),
      );

      return remoteData.toListRaw((data) =>
          (data as List).map((item) => ShopRaw.fromJson(item)).toList());
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
