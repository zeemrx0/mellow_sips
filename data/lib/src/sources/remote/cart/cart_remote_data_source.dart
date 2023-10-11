part of '../base_remote_data_source.dart';

abstract class CartRemoteDataSource {
  Future<AppListResultRaw<CartRaw>> getAllCarts();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final NetworkService _networkService;

  CartRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppListResultRaw<CartRaw>> getAllCarts() async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.carts,
          method: HttpMethod.get,
          isRequestedForList: true,
        ),
      );

      return remoteData.toListRaw(
        (data) => data.map((e) => CartRaw.fromJson(e)).toList(),
      );
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
