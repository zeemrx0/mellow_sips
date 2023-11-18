part of '../base_use_case.dart';

abstract class UpdateCartItemUseCase
    extends BaseUseCase<UpdateCartItemParam, EmptyModel> {}

class UpdateCartItemUseCaseImpl extends UpdateCartItemUseCase {
  final CartRepository _cartRepository;

  UpdateCartItemUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject({
    UpdateCartItemParam? param,
  }) =>
      _cartRepository.updateCartItem(params: param!.toJson());
}
