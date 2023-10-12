part of './base_repository.dart';

abstract class CartRepository {
  Future<AppListResultModel<CartModel>> getAllCarts();

  Future<AppObjectResultModel<EmptyModel>> addToCart({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<CartModel>> getCartDetail({
    required Map<String, dynamic> params,
  });
}
