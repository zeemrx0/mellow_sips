part of '../base_use_case.dart';

abstract class GetBestSellingProductsUseCase
    extends BaseUseCase<GetBestSellingProductsParam, ProductModel> {}

class GetBestSellingProductsUseCaseImpl extends GetBestSellingProductsUseCase {
  final HomeRepository _homeRepository;

  GetBestSellingProductsUseCaseImpl(this._homeRepository);

  @override
  Future<AppPaginationListResultModel<ProductModel>> executePaginationList({
    GetBestSellingProductsParam? param,
  }) {
    return _homeRepository.getBestSellingProducts(params: param!.toJson());
  }
}
