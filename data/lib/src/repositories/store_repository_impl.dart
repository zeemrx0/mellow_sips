import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreRemoteDataSource _storeRemoteDataSource;

  StoreRepositoryImpl(this._storeRemoteDataSource);

  @override
  Future<AppPaginationListResultModel<StoreModel>> getStoreList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData =
          await _storeRemoteDataSource.getStoreList(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<StoreModel>> searchStores({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _storeRemoteDataSource.searchStores(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<MenuModel>> getStoreMenu({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _storeRemoteDataSource.getStoreMenu(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<StoreModel>> getStoreDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _storeRemoteDataSource.getStoreDetail(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
