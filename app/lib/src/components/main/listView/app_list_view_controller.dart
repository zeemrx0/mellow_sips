import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part './app_list_view_widget.dart';

abstract class AppListViewController<BM extends BaseModel> extends GetxController {
  RxList<BM> data = RxList.empty();
  Rxn<AppException> appException = Rxn<AppException>();
  Rx<int> total = Rx(0);
  Rx<bool> hasMore = Rx(false);

  AppListParam _appListParam = AppListParam();

  Future<AppPaginationListResultModel<BM>> onCall(AppListParam appListParam);

  @override
  void onReady() {
    super.onReady();
    initFetch();
  }

  @override
  void onClose() {
    super.onClose();
    Logs.e('AppListViewController closed');
  }

  void initFetch() async {
    try {
      AppLoadingOverlayWidget.show();
      final response = await onCall(_appListParam);
      AppLoadingOverlayWidget.dismiss();
      data.value = [...response.netData ?? List.empty()];
      total.value = response.total;
      hasMore.value = response.hasMore;
      appException.value = null;
      Logs.i(
          'AppListWidget Init Call: Data length ${data.length} --- total: ${total.value}');
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(
        appException: e,
        onError: (_) => appException.value = e,
      ).detected();
    }
  }

  Future<void> onRefreshCall() async {
    try {
      _appListParam = _appListParam.copyWith(page: 1);
      final response = await onCall(_appListParam);
      data.value = [...response.netData ?? List.empty()];
      total.value = response.total;
      hasMore.value = response.hasMore;
      appException.value = null;
      Logs.i(
          'AppListWidget Refresh: Data length ${data.length} --- total: ${total.value}');
    } on AppException catch (e) {
      AppExceptionExt(
        appException: e,
        onError: (_) => appException.value = e,
      ).detected();
    }
  }

  Future<void> onRefreshCallWithLoading() async {
    AppLoadingOverlayWidget.show();
    await onRefreshCall();
    AppLoadingOverlayWidget.dismiss();
  }

  Future<void> onLoadMoreCall() async {
    try {
      _appListParam = _appListParam.copyWith(page: _appListParam.page + 1);
      final response = await onCall(_appListParam);
      data.value = [
        ...data,
        ...response.netData ?? List.empty(),
      ];
      total.value = response.total;
      hasMore.value = response.hasMore;
      appException.value = null;
    } on AppException catch (e) {
      appException.value = e;
    }
  }
}
