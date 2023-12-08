part of '../base_use_case.dart';

abstract class GetPromotingStoreListUseCase
    extends BaseUseCase<GetPromotingStoreListParam, StoreModel> {}

class GetPromotingStoreListUseCaseImpl extends GetPromotingStoreListUseCase {
  final HomeRepository _homeRepository;

  GetPromotingStoreListUseCaseImpl(this._homeRepository);

  @override
  Future<AppPaginationListResultModel<StoreModel>> executePaginationList({
    GetPromotingStoreListParam? param,
  }) {
    return _homeRepository.getPromotingStoreList(params: param!.toJson());
  }
}
