import 'package:data/src/sources/remote/base_remote_data_source.dart';
import 'package:data/src/sources/webSockets/notification_web_socket.dart';
import 'package:domain/domain.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationWebSocket _notificationWebSocket;
  final NotificationRemoteDataSource _notificationRemoteDataSource;

  NotificationRepositoryImpl(
      this._notificationWebSocket, this._notificationRemoteDataSource);

  @override
  Future<AppObjectResultModel<EmptyModel>> connect({
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  }) async {
    try {
      final webSocketData = await _notificationWebSocket.connect(
        onReceiveGlobalNotification: onReceiveGlobalNotification,
        onReceiveUserNotification: onReceiveUserNotification,
      );

      return webSocketData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> disconnect() async {
    try {
      final webSocketData = await _notificationWebSocket.disconnect();

      return webSocketData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppPaginationListResultModel<NotificationModel>> searchNotifications({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData = await _notificationRemoteDataSource
          .searchNotifications(params: params);
      return remoteData.toAppPaginationListResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> markAsRead({
    required Map<String, dynamic> params,
  }) async {
    try {
      final remoteData =
          await _notificationRemoteDataSource.markAsRead(params: params);
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppObjectResultModel<EmptyModel>> markAllAsRead() async {
    try {
      final remoteData = await _notificationRemoteDataSource.markAllAsRead();
      return remoteData.toAppObjectResultModel();
    } on NetworkException catch (_) {
      rethrow;
    }
  }
}
