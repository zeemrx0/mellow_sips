import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class StoreRepositoryImpl extends StoreRepository {
  final StoreRemoteDataSource _storeRemoteDataSource;

  StoreRepositoryImpl(this._storeRemoteDataSource);

  @override
  Future<AppListResultModel<StoreModel>> getStoreList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData =
          await _storeRemoteDataSource.getStoreList(params: params);
      return remoteData.toAppListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppListResultModel<StoreModel>> searchStores({
    required Map<String, dynamic> params,
  }) async {
    final remoteData =
        await _storeRemoteDataSource.searchStores(params: params);
    return remoteData.toAppListResultModel();
  }
}
