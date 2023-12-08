import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './store_review_page.dart';
part './store_review_binding.dart';

class StoreReviewController extends AppListViewController<StoreReviewModel> {
  final SearchStoreReviewsUseCase _searchStoreReviewsUseCase;

  StoreReviewController(
    this._searchStoreReviewsUseCase,
  );

  @override
  Future<AppPaginationListResultModel<StoreReviewModel>> onCall(
    AppListParam appListParam,
  ) async {
    final response = await _searchStoreReviewsUseCase.executePaginationList(
      param: SearchStoreReviewsParam(
        storeId: Get.arguments[AppConstants.storeId],
        pagination: appListParam.toJson,
      ),
    );

    return Future(
      () => AppPaginationListResultModel(
        netData: response.netData ?? List.empty(),
        hasMore: response.hasMore,
        total: response.total,
      ),
    );
  }
}
