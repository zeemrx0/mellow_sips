part of '../base_use_case.dart';

abstract class CreateOrderUseCase
    extends BaseUseCase<CreateOrderParam, OrderModel> {}

class CreateOrderUseCaseImpl extends CreateOrderUseCase {
  final OrderRepository _documentRepository;

  CreateOrderUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<OrderModel>> executeObject({
    CreateOrderParam? param,
  }) =>
      _documentRepository.createOrder(
        params: param!.toJson(),
      );
}
