part of '../base_use_case.dart';

abstract class GetStoreListUseCase
    extends BaseUseCase<GetStoreListParam, StoreModel> {}

class GetStoreListUseCaseImpl extends GetStoreListUseCase {
  final StoreRepository _storeRepository;

  GetStoreListUseCaseImpl(this._storeRepository);

  @override
  Future<AppListResultModel<StoreModel>> executeList({GetStoreListParam? param}) {
    return _storeRepository.getStoreList(params: param!.toJson());
  }
}