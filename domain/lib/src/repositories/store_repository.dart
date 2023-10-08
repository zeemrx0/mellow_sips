part of './base_repository.dart';

abstract class StoreRepository {
  Future<AppListResultModel<StoreModel>> getStoreList({required Map<String, dynamic> params});
  Future<AppListResultModel<StoreModel>> searchStores({required Map<String, dynamic> params});
  Future<AppObjectResultModel<MenuModel>> getStoreMenu({required Map<String, dynamic> params});
}
