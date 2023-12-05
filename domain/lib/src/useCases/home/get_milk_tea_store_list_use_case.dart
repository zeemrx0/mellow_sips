part of '../base_use_case.dart';

abstract class GetMilkTeaStoreListUseCase
    extends BaseUseCase<GetMilkTeaStoreListParam, StoreModel> {}

class GetMilkTeaStoreListUseCaseImpl extends GetMilkTeaStoreListUseCase {
  final HomeRepository _homeRepository;

  GetMilkTeaStoreListUseCaseImpl(this._homeRepository);

  @override
  Future<AppPaginationListResultModel<StoreModel>> executePaginationList({
    GetMilkTeaStoreListParam? param,
  }) {
    return _homeRepository.getMilkTeaStoreList(params: param!.toJson());
  }
}
