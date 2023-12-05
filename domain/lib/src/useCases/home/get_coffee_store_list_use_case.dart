part of '../base_use_case.dart';

abstract class GetCoffeeStoreListUseCase
    extends BaseUseCase<GetCoffeeStoreListParam, StoreModel> {}

class GetCoffeeStoreListUseCaseImpl extends GetCoffeeStoreListUseCase {
  final HomeRepository _homeRepository;

  GetCoffeeStoreListUseCaseImpl(this._homeRepository);

  @override
  Future<AppPaginationListResultModel<StoreModel>> executePaginationList({
    GetCoffeeStoreListParam? param,
  }) {
    return _homeRepository.getCoffeeStoreList(params: param!.toJson());
  }
}
