import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/storeList/components/store_item_widget.dart';
import 'package:app/src/pages/storeList/components/toogle_chip_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './store_list_page.dart';
part './store_list_binding.dart';

class StoreListKey {
  static const hasPromo = 'hasPromo';
  static const isOpen = 'isOpen';
  static const filter = 'filter';
  static const isActive = 'isActive';
}

class StoreListController extends AppListViewController<StoreModel> {
  final SearchStoresUseCase _searchStoresUseCase;
  final GetDocumentUseCase _getDocumentUseCase;

  StoreListController(this._searchStoresUseCase, this._getDocumentUseCase);

  @override
  Future<AppListResultModel<StoreModel>> onCall(
      AppListParam appListParam) async {
    final response = await _searchStoresUseCase.executeList(
      param: SearchStoresParam(
        criteria: {
          StoreListKey.filter: {
            StoreListKey.isActive: true,
          }
        },
        pagination: AppListParam(
          page: appListParam.page,
          itemsPerPage: appListParam.itemsPerPage,
        ).toJson,
      ),
    );

    final storeList = response.netData ?? List.empty();

    final storeListWithImage = await Future.wait(
      storeList.map(
        (store) async {
          final image = await getImage(store.coverImage);
          return store.copyWith(coverImage: image);
        },
      ),
    );

    return Future(
      () => AppListResultModel(
        netData: storeListWithImage,
        hasMore: response.hasMore,
        total: response.total,
      ),
    );
  }

  Future<String?> getImage(String? imageId) async {
    if (imageId == null) return null;

    final splitId = imageId.split('|').last;

    final response = await _getDocumentUseCase.executeObject(
      param: GetDocumentParam(
        documentId: splitId,
      ),
    );

    return Future.value(response.netData!.content);
  }
}
