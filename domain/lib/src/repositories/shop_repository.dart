part of './base_repository.dart';

abstract class ShopRepository {
  Future<AppListResultModel<ShopModel>> getShopList({required Map<String, dynamic> params});
}
