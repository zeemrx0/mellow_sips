part of '../base_remote_data_source.dart';

abstract class ProductRemoteDataSource {
  Future<AppObjectResultRaw<ProductRaw>> getProductDetail({
    required Map<String, dynamic> params,
  });
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkService _networkService;

  ProductRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<ProductRaw>> getProductDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.productDetail}/${params['productId']}',
          method: HttpMethod.get,
        ),
      );

      return remoteData.toObjectRaw((data) => ProductRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
