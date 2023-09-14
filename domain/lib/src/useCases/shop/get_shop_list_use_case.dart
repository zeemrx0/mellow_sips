part of '../base_use_case.dart';

abstract class GetShopListUseCase
    extends BaseUseCase<GetShopListParam, ShopModel> {}

class GetShopListUseCaseImpl extends GetShopListUseCase {
  final ShopRepository _shopRepository;

  GetShopListUseCaseImpl(this._shopRepository);

  @override
  Future<AppListResultModel<ShopModel>> executeList({GetShopListParam? param}) {
    return _shopRepository.getShopList(params: param!.toJson());
  }
}