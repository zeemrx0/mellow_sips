part of './base_repository.dart';

abstract class ProductRepository {
  Future<AppObjectResultModel<ProductModel>> getProductDetail({
    required Map<String, dynamic> params,
  });
}
