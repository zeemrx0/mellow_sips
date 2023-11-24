import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<AppListResultModel<CartModel>> getAllCarts() async {
    try {
      final remoteData = await _cartRemoteDataSource.getAllCarts();
      return remoteData.toAppListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> addToCart({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.addToCart(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<CartModel>> getCartDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.getCartDetail(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<VouchersModel>> getCartVouchers({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.getCartVouchers(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> deleteCart({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.deleteCart(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> deleteCartItem({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.deleteCartItem(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> updateCartItem({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.updateCartItem(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<CartModel>> calculateCartWithVouchers({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _cartRemoteDataSource.calculateCartWithVouchers(
        params: params,
      );
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
