import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<AppPaginationListResultModel<StoreModel>> getCoffeeStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _homeRemoteDataSource.getCoffeeStoreList(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<StoreModel>> getMilkTeaStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _homeRemoteDataSource.getMilkTeaStoreList(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<StoreModel>> getPromotingStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _homeRemoteDataSource.getPromotingStoreList(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<StoreModel>> getQualifiedStoreList({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _homeRemoteDataSource.getQualifiedStoreList(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<ProductModel>> getBestSellingProducts({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _homeRemoteDataSource.getBestSellingProducts(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
