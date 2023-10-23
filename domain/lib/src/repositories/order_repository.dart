part of './base_repository.dart';

abstract class OrderRepository {
  Future<AppObjectResultModel<OrderModel>> getOrderDetail({
    required Map<String, dynamic> params,
  });
}
