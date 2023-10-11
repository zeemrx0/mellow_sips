part of '../base_use_case.dart';

abstract class GetAllCartUseCase extends BaseUseCase<BaseParam, CartModel> {}

class GetCartUseCaseImpl extends GetAllCartUseCase {
  final CartRepository _cartRepository;

  GetCartUseCaseImpl(this._cartRepository);

  @override
  Future<AppListResultModel<CartModel>> executeList({BaseParam? param}) =>
      _cartRepository.getAllCarts();
}
