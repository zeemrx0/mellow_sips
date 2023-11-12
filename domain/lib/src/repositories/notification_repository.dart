part of './base_repository.dart';

abstract class NotificationRepository {
  Future<AppObjectResultModel<EmptyModel>> connect({
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  });
}
