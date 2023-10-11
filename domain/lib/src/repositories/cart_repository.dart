part of './base_repository.dart';

abstract class CartRepository {
  Future<AppListResultModel<CartModel>> getAllCarts();
}
