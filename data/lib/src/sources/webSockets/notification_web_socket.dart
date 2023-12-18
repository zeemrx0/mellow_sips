import 'package:configs/configs.dart';
import 'package:data/src/network/network_service.dart';
import 'package:data/src/raws/base_raw.dart';
import 'package:data/src/sources/local/base_local_data_source.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class NotificationWebSocket {
  final AuthLocalDataSource _authLocalDataSource;
  StompClient? _stompClient;

  NotificationWebSocket(this._authLocalDataSource);

  Future<void> _initialize({
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  }) async {
    final tokens = await _authLocalDataSource.getTokens();

    Map<String, String>? headers;

    if (tokens.netData?.accessToken != null &&
        tokens.netData!.accessToken.isNotEmpty) {
      headers = {
        'Authorization': tokens.netData!.accessToken,
      };

      _stompClient = StompClient(
        config: StompConfig(
          useSockJS: true,
          url: '${BuildConfig.apiDomain}/ws',
          stompConnectHeaders: headers,
          webSocketConnectHeaders: headers,
          onConnect: (p0) {
            _onConnectHandler(
              p0,
              onReceiveGlobalNotification: onReceiveGlobalNotification,
              onReceiveUserNotification: onReceiveUserNotification,
            );
          },
          onStompError: (p0) {
            throw Exception(p0);
          },
          onWebSocketError: (p0) {
            throw Exception(p0);
          },
        ),
      );

      print('sub auth');
    } else {
      _stompClient = StompClient(
        config: StompConfig(
          useSockJS: true,
          url: '${BuildConfig.apiDomain}/ws',
          onConnect: (p0) {
            _onConnectHandler(
              p0,
              onReceiveGlobalNotification: onReceiveGlobalNotification,
              onReceiveUserNotification: onReceiveUserNotification,
            );
          },
          onStompError: (p0) {
            throw Exception(p0);
          },
          onWebSocketError: (p0) {
            throw Exception(p0);
          },
        ),
      );

      print('sub no auth');
    }
  }

  Future<AppObjectResultRaw<EmptyRaw>> connect({
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  }) async {
    await _initialize(
      onReceiveGlobalNotification: onReceiveGlobalNotification,
      onReceiveUserNotification: onReceiveUserNotification,
    );
    _stompClient?.activate();

    return Future.value(
      AppObjectResultRaw(
        netData: EmptyRaw(),
      ),
    );
  }

  Future<AppObjectResultRaw<EmptyRaw>> disconnect() async {
    _stompClient?.deactivate();
    _stompClient = null;

    return Future.value(
      AppObjectResultRaw(
        netData: EmptyRaw(),
      ),
    );
  }

  void _onConnectHandler(
    StompFrame frame, {
    Function? onReceiveGlobalNotification,
    Function? onReceiveUserNotification,
  }) async {
    _stompClient?.subscribe(
      destination: ApiProvider.notificationSocket,
      callback: (frame) {
        onReceiveGlobalNotification?.call(frame);
      },
    );

    _stompClient?.subscribe(
      destination: ApiProvider.userNotificationSocket,
      callback: (frame) {
        onReceiveUserNotification?.call(frame);
      },
    );
  }
}
