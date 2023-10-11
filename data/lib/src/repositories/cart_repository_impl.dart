import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<AppListResultModel<CartModel>> getAllCarts() async {
    try {
      final remoteData =
          await _cartRemoteDataSource.getAllCarts();
      return remoteData.toAppListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
