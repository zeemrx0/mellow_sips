part of './base_repository.dart';

abstract class CartRepository {
  Future<AppListResultModel<CartModel>> getAllCarts();

  Future<AppObjectResultModel<EmptyModel>> addToCart({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<CartModel>> getCartDetail({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<VouchersModel>> getCartVouchers({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> deleteCart({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> deleteCartItem({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> updateCartItem({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<CartModel>> calculateCartWithVouchers({
    required Map<String, dynamic> params,
  });
}
