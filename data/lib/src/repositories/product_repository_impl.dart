import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:domain/domain.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<AppObjectResultModel<ProductModel>> getProductDetail({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _productRemoteDataSource.getProductDetail(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
