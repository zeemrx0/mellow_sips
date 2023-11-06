import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderRemoteDataSource _orderRemoteDataSource;

  OrderRepositoryImpl(this._orderRemoteDataSource);

  @override
  Future<AppObjectResultModel<OrderModel>> getOrderDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _orderRemoteDataSource.getOrderDetail(params: params);

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<OrderModel>> createOrder({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _orderRemoteDataSource.createOrder(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> updateOrderStatus({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _orderRemoteDataSource.updateOrderStatus(
        params: params,
      );

      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
