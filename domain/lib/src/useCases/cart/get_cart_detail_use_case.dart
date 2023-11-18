part of '../base_use_case.dart';

abstract class GetCartDetailUseCase
    extends BaseUseCase<GetCartDetailParam, CartModel> {}

class GetCartDetailUseCaseImpl extends GetCartDetailUseCase {
  final CartRepository _cartRepository;

  GetCartDetailUseCaseImpl(this._cartRepository);

  @override
  Future<AppObjectResultModel<CartModel>> executeObject({
    GetCartDetailParam? param,
  }) =>
      _cartRepository.getCartDetail(params: param!.toJson());
}
