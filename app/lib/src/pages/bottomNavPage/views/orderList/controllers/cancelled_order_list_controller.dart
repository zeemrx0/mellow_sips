import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/order_list_controller.dart';
import 'package:domain/domain.dart';

class CancelledOrderListController extends AppListViewController<OrderModel> {
  final SearchOrdersUseCase _searchOrdersUseCase;

  CancelledOrderListController(this._searchOrdersUseCase);

  @override
  Future<AppPaginationListResultModel<OrderModel>> onCall(
    AppListParam appListParam,
  ) async {
    final response = await _searchOrdersUseCase.executePaginationList(
      param: SearchOrdersParam(
        criteria: {
          OrderListKey.filter: {
            AppConstants.status: AppOrderStatus.cancelled,
          },
          AppConstants.order: {
            AppConstants.createdAt: AppConstants.desc,
          },
        },
        pagination: AppListParam(
          page: appListParam.page,
          itemsPerPage: appListParam.itemsPerPage,
        ).toJson,
      ),
    );

    return Future(
      () => AppPaginationListResultModel(
        netData: response.netData,
        hasMore: response.hasMore,
        total: response.total,
      ),
    );
  }
}
