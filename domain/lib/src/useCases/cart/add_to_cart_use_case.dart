part of '../base_use_case.dart';

abstract class AddToCartUseCase
    extends BaseUseCase<AddToCartParam, EmptyModel> {}

class AddToCartUseCaseImpl extends AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject(
          {AddToCartParam? param}) =>
      _cartRepository.addToCart(params: param!.toJson());
}
