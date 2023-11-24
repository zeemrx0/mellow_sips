part of './base_repository.dart';

abstract class NotificationRepository {
  Future<AppObjectResultModel<EmptyModel>> connect({
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  });

  Future<AppObjectResultModel<EmptyModel>> disconnect();

  Future<AppPaginationListResultModel<NotificationModel>> searchNotifications({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> markAsRead({
    required Map<String, dynamic> params,
  });

  Future<AppObjectResultModel<EmptyModel>> markAllAsRead();
}
