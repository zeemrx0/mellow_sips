part of '../base_use_case.dart';

abstract class CalculateCartWithVouchersUseCase
    extends BaseUseCase<CalculateCartWithVouchersParam, CartModel> {}

class CalculateCartWithVouchersUseCaseImpl
    extends CalculateCartWithVouchersUseCase {
  final CartRepository _cartRepository;

  CalculateCartWithVouchersUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<CartModel>> executeObject({
    CalculateCartWithVouchersParam? param,
  }) =>
      _cartRepository.calculateCartWithVouchers(params: param!.toJson());
}
