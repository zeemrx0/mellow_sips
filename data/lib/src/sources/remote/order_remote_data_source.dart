part of './base_remote_data_source.dart';

abstract class OrderRemoteDataSource {
  Future<AppObjectResultRaw<OrderRaw>> getOrderDetail({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<OrderRaw>> createOrder({
    required Map<String, dynamic> params,
  });
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final NetworkService _networkService;

  OrderRemoteDataSourceImpl(this._networkService);

  @override
  Future<AppObjectResultRaw<OrderRaw>> getOrderDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final response = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.orders}/${params['orderId']}',
          method: HttpMethod.get,
        ),
      );

      return response.toObjectRaw((data) => OrderRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<OrderRaw>> createOrder({
    required Map<String, dynamic> params,
  }) async {
    try {
      final response = await _networkService.request(
        clientRequest: ClientRequest(
          url: ApiProvider.orders,
          method: HttpMethod.post,
          body: params,
        ),
      );

      print((response.data as Map<String, dynamic>)['externalPaymentInfo']);

      return response.toObjectRaw((data) => OrderRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
