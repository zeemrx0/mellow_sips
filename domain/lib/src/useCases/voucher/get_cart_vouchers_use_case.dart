part of '../base_use_case.dart';

abstract class GetCartVouchersUseCase
    extends BaseUseCase<GetCartVouchersParam, VouchersModel> {}

class GetCartVouchersUseCaseImpl extends GetCartVouchersUseCase {
  final CartRepository _cartRepository;

  GetCartVouchersUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<VouchersModel>> executeObject({
    GetCartVouchersParam? param,
  }) {
    return _cartRepository.getCartVouchers(params: param!.toJson());
  }
}
