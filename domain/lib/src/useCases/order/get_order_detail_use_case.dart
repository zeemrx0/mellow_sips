part of '../base_use_case.dart';

abstract class GetOrderDetailUseCase
    extends BaseUseCase<GetOrderDetailParam, OrderModel> {}

class GetOrderDetailUseCaseImpl extends GetOrderDetailUseCase {
  final OrderRepository _documentRepository;

  GetOrderDetailUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<OrderModel>> executeObject(
          {GetOrderDetailParam? param}) =>
      _documentRepository.getOrderDetail(
        params: param!.toJson(),
      );
}
