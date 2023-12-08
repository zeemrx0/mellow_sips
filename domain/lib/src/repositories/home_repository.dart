part of './base_repository.dart';

abstract class HomeRepository {
  Future<AppPaginationListResultModel<StoreModel>> getCoffeeStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultModel<StoreModel>> getMilkTeaStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultModel<StoreModel>> getPromotingStoreList({
    required Map<String, dynamic> params,
  });

  Future<AppPaginationListResultModel<StoreModel>> getQualifiedStoreList({
    required Map<String, dynamic> params,
  });
}
