part of '../base_use_case.dart';

abstract class GetStoreDetailUseCase
    extends BaseUseCase<GetStoreDetailParam, StoreModel> {}

class GetStoreDetailUseCaseImpl extends GetStoreDetailUseCase {
  final StoreRepository _storeRepository;

  GetStoreDetailUseCaseImpl(this._storeRepository);

  @override
  Future<AppObjectResultModel<StoreModel>> executeObject({GetStoreDetailParam? param}) {
    return _storeRepository.getStoreDetail(params: param!.toJson());
  }
}