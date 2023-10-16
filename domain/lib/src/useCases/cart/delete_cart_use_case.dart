part of '../base_use_case.dart';

abstract class DeleteCartUseCase
    extends BaseUseCase<DeleteCartParam, EmptyModel> {}

class DeleteCartUseCaseImpl extends DeleteCartUseCase {
  final CartRepository _cartRepository;

  DeleteCartUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject(
          {DeleteCartParam? param}) =>
      _cartRepository.deleteCart(params: param!.toJson());
}
