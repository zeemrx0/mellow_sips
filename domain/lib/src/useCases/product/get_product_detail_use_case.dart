part of '../base_use_case.dart';

abstract class GetProductDetailUseCase
    extends BaseUseCase<GetProductDetailParam, ProductModel> {}

class GetProductDetailUseCaseImpl extends GetProductDetailUseCase {
  final ProductRepository _productRepository;

  GetProductDetailUseCaseImpl(this._productRepository);

  @override
  Future<AppObjectResultModel<ProductModel>> executeObject(
          {GetProductDetailParam? param}) =>
      _productRepository.getProductDetail(
        params: param!.toJson(),
      );
}
