import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/shopList/components/shop_item_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './shop_list_page.dart';
part './shop_list_binding.dart';

class ShopListController extends AppListViewController<ShopModel> {
  final GetShopListUseCase _getShopListUseCase;

  ShopListController(this._getShopListUseCase);

  @override
  Future<AppListResultModel<ShopModel>> onCall(
      AppListParam appListParam) async {
    final response = await _getShopListUseCase.executeList(
      param: GetShopListParam(
        page: appListParam.page,
        limit: appListParam.limit,
      ),
    );

    return Future(
      () => AppListResultModel(
        netData: response.netData ?? List.empty(),
        hasMore: response.hasMore,
        total: response.total,
      ),
    );
  }
}
