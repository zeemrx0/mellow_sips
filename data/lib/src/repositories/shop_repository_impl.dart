import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopRemoteDataSource _shopRemoteDataSource;

  ShopRepositoryImpl(this._shopRemoteDataSource);

  @override
  Future<AppListResultModel<ShopModel>> getShopList(
      {required Map<String, dynamic> params}) async {
    try {
      final remoteData =
          await _shopRemoteDataSource.getShopList(params: params);
      return remoteData.toAppListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
