import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'notification_page.dart';

class NotificationController extends AppListViewController<NotificationModel> {
  final SearchNotificationsUseCase _searchNotificationsUseCase;
  final MarkNotificationAsReadUseCase _markNotificationAsReadUseCase;
  final MarkAllNotificationAsReadUseCase _markAllNotificationAsReadUseCase;

  NotificationController(
    this._searchNotificationsUseCase,
    this._markNotificationAsReadUseCase,
    this._markAllNotificationAsReadUseCase,
  );

  @override
  Future<AppPaginationListResultModel<NotificationModel>> onCall(
    AppListParam appListParam,
  ) async {
    final response = await _searchNotificationsUseCase.executePaginationList(
      param: SearchNotificationsParam(
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

  Future<void> markAsRead(String notificationId) async {
    try {
      AppLoadingOverlayWidget.show();

      await _markNotificationAsReadUseCase.executeObject(
        param: MarkNotificationAsReadParam(
          notificationId: notificationId,
        ),
      );

      await onRefreshCallWithLoading();

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> markAllAsRead() async {
    try {
      AppLoadingOverlayWidget.show();

      await _markAllNotificationAsReadUseCase.executeObject();

      await onRefreshCallWithLoading();

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  String? getNotificationSubject(NotificationModel notification) {
    switch (notification.subject) {
      case NotificationKey.orderProcessing:
        return R.strings.yourOrderIsBeingPrepared;
      case NotificationKey.orderCompleted:
        return R.strings.yourOrderHasBeenCompleted;
      default:
        return notification.subject;
    }
  }
}
