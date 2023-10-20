part of '../base_use_case.dart';

abstract class DeleteCartItemUseCase
    extends BaseUseCase<DeleteCartItemParam, EmptyModel> {}

class DeleteCartItemUseCaseImpl extends DeleteCartItemUseCase {
  final CartRepository _cartRepository;

  DeleteCartItemUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject(
          {DeleteCartItemParam? param}) =>
      _cartRepository.deleteCartItem(params: param!.toJson());
}
