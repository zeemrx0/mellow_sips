import 'package:data/src/sources/webSockets/notification_web_socket.dart';
import 'package:domain/domain.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationWebSocket _notificationWebSocket;

  NotificationRepositoryImpl(this._notificationWebSocket);

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
}
