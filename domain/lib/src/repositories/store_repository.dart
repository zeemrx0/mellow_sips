part of './base_repository.dart';

abstract class StoreRepository {
  Future<AppPaginationListResultModel<StoreModel>> getStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultModel<StoreModel>> searchStores({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<MenuModel>> getStoreMenu({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<StoreModel>> getStoreDetail({
    required Map<String, dynamic> params,
  });
}
