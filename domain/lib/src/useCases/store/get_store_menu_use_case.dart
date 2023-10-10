part of '../base_use_case.dart';

abstract class GetStoreMenuUseCase
    extends BaseUseCase<GetStoreDetailParam, MenuModel> {}

class GetStoreMenuUseCaseImpl extends GetStoreMenuUseCase {
  final StoreRepository _storeRepository;

  GetStoreMenuUseCaseImpl(this._storeRepository);

  @override
  Future<AppObjectResultModel<MenuModel>> executeObject({GetStoreDetailParam? param}) {
    return _storeRepository.getStoreMenu(params: param!.toJson());
  }
}