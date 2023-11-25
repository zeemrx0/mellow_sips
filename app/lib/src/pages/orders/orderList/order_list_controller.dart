import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/bottomNavigationBar/app_bottom_navigation_bar_widget.dart';
import 'package:app/src/components/features/floatingAppButton/floating_app_button.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/orders/orderList/components/order_item_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './order_list_page.dart';
part './order_list_binding.dart';

class OrderListKey {
  static const filter = 'filter';
}

class OrderListController extends AppListViewController<OrderModel> {
  final SearchOrdersUseCase _searchOrdersUseCase;

  OrderListController(this._searchOrdersUseCase);

  @override
  Future<AppPaginationListResultModel<OrderModel>> onCall(
    AppListParam appListParam,
  ) async {
    final response = await _searchOrdersUseCase.executePaginationList(
      param: SearchOrdersParam(
        criteria: {
          OrderListKey.filter: {},
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
