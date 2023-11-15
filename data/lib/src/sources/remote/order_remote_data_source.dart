part of './base_remote_data_source.dart';

abstract class OrderRemoteDataSource {
  Future<AppObjectResultRaw<OrderRaw>> getOrderDetail({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultRaw<OrderRaw>> searchOrders({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<OrderRaw>> createOrder({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<EmptyRaw>> updateOrderStatus({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultRaw<OrderTransactionRaw>> getTransactionByOrderId({
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
  Future<AppPaginationListResultRaw<OrderRaw>> searchOrders({
    required Map<String, dynamic> params,
  }) async {
    try {
      final response = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.orders}/search',
          method: HttpMethod.post,
          body: params,
          requestType: RequestType.paginationList,
        ),
      );

      return response.toPaginationListRaw(
        (data) => (data as List).map((e) => OrderRaw.fromJson(e)).toList(),
      );
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

      return response.toObjectRaw((data) => OrderRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<EmptyRaw>> updateOrderStatus({
    required Map<String, dynamic> params,
  }) async {
    try {
      final response = await _networkService.request(
        clientRequest: ClientRequest(
          url:
              '${ApiProvider.orders}/${params['orderId']}/events/${params['status']}',
          method: HttpMethod.put,
          body: params,
        ),
      );

      return response.toObjectRaw((data) => EmptyRaw());
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultRaw<OrderTransactionRaw>> getTransactionByOrderId({
    required Map<String, dynamic> params,
  }) async {
    try {
      final response = await _networkService.request(
        clientRequest: ClientRequest(
          url: '${ApiProvider.orders}/${params['orderId']}/transactions',
          method: HttpMethod.post,
        ),
      );

      return response.toObjectRaw((data) => OrderTransactionRaw.fromJson(data));
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
