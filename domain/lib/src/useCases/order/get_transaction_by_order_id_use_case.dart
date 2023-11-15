part of '../base_use_case.dart';

abstract class GetTransactionByOrderIdUseCase extends BaseUseCase<
    GetTransactionByOrderIdParam, OrderTransactionModel> {}

class GetTransactionByOrderIdUseCaseImpl extends GetTransactionByOrderIdUseCase {
  final OrderRepository _documentRepository;

  GetTransactionByOrderIdUseCaseImpl(this._documentRepository);

  @override
  Future<AppObjectResultModel<OrderTransactionModel>> executeObject({
    GetTransactionByOrderIdParam? param,
  }) =>
      _documentRepository.getTransactionByOrderId(
        params: param!.toJson(),
      );
}
