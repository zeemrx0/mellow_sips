part of '../base_use_case.dart';

abstract class UpdateOrderStatusUseCase
    extends BaseUseCase<UpdateOrderStatusParam, EmptyModel> {}

class UpdateOrderStatusUseCaseImpl extends UpdateOrderStatusUseCase {
  final OrderRepository _documentRepository;

  UpdateOrderStatusUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<EmptyModel>> executeObject(
          {UpdateOrderStatusParam? param}) =>
      _documentRepository.updateOrderStatus(
        params: param!.toJson(),
      );
}
