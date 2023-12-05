part of '../base_use_case.dart';

abstract class GetQualifiedStoreListUseCase
    extends BaseUseCase<GetQualifiedStoreListParam, StoreModel> {}

class GetQualifiedStoreListUseCaseImpl extends GetQualifiedStoreListUseCase {
  final HomeRepository _homeRepository;

  GetQualifiedStoreListUseCaseImpl(this._homeRepository);

  @override
  Future<AppPaginationListResultModel<StoreModel>> executePaginationList({
    GetQualifiedStoreListParam? param,
  }) {
    return _homeRepository.getQualifiedStoreList(params: param!.toJson());
  }
}
