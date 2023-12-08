import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/store/store_item_widget.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'milk_tea_store_list_page.dart';
part 'milk_tea_store_list_binding.dart';

class MilkTeaStoreListKey {
  static const hasPromo = 'hasPromo';
  static const isOpen = 'isOpen';
  static const filter = 'filter';
  static const isActive = 'isActive';
  static const keyword = 'keyword';
}

class MilkTeaStoreListController extends AppListViewController<StoreModel> {
  final GetMilkTeaStoreListUseCase _getMilkTeaStoreListUseCase;
  final GetDocumentUseCase _getDocumentUseCase;

  Rx<String> keyword = ''.obs;
  Rx<bool> isOpen = true.obs;

  MilkTeaStoreListController(
    this._getMilkTeaStoreListUseCase,
    this._getDocumentUseCase,
  );

  @override
  Future<AppPaginationListResultModel<StoreModel>> onCall(
      AppListParam appListParam) async {
    final response = await _getMilkTeaStoreListUseCase.executePaginationList(
      param: GetMilkTeaStoreListParam(
        page: appListParam.page,
        itemsPerPage: appListParam.itemsPerPage,
      ),
    );

    final storeList = response.netData ?? List.empty();

    final storeListWithImage = await Future.wait(
      storeList.map(
        (store) async {
          final image = await AppImageExt.getImage(
            _getDocumentUseCase,
            store.coverImage,
          );
          return store.copyWith(coverImageData: image);
        },
      ),
    );

    return Future(
      () => AppPaginationListResultModel(
        netData: storeListWithImage,
        hasMore: response.hasMore,
        total: response.total,
      ),
    );
  }
}
