part of '../base_use_case.dart';

abstract class SearchOrdersUseCase
    extends BaseUseCase<SearchOrdersParam, OrderModel> {}

class SearchOrdersUseCaseImpl extends SearchOrdersUseCase {
  final OrderRepository _orderRepository;

  SearchOrdersUseCaseImpl(this._orderRepository);

  @override
  Future<AppPaginationListResultModel<OrderModel>> executePaginationList({
    SearchOrdersParam? param,
  }) {
    return _orderRepository.searchOrders(params: param!.toJson());
  }
}
