part of '../base_remote_data_source.dart';

abstract class CartRemoteDataSource {
  Future<AppListResultRaw<CartRaw>> getAllCarts();

  Future<AppObjectResultRaw<EmptyRaw>> addToCart({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<CartRaw>> getCartDetail({
    required Map<String, dynamic> params,
  });
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
          requestType: RequestType.list,
        ),
      );

      return remoteData.toListRaw(
        (data) =>
            (data as List<dynamic>).map((e) => CartRaw.fromJson(e)).toList(),
      );
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> addToCart(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.carts,
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
  Future<AppObjectResultRaw<CartRaw>> getCartDetail(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.carts}/${params['cartId']}',
          method: HttpMethod.get,
          requestType: RequestType.object,
        ),
      );

      return remoteData.toObjectRaw((data) => CartRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
