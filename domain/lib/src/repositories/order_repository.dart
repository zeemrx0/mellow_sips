part of './base_repository.dart';

abstract class OrderRepository {
  Future<AppObjectResultModel<OrderModel>> getOrderDetail({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<OrderModel>> createOrder({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> updateOrderStatus({
    required Map<String, dynamic> params,
  });
}
