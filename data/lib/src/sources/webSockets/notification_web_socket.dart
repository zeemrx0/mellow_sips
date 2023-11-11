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

  void _initialize() {
    if (_stompClient != null) return;

    _stompClient = StompClient(
      config: StompConfig(
        useSockJS: true,
        url: '${BuildConfig.apiDomain}/ws',
        onConnect: onConnectHandler,
      ),
    );
  }

  Future<AppObjectResultRaw<EmptyRaw>> connect() async {
    _initialize();
    _stompClient?.activate();

    return Future.value(
      AppObjectResultRaw(
        netData: EmptyRaw(),
      ),
    );
  }

  void onConnectHandler(StompFrame frame) async {
    _stompClient?.subscribe(
      destination: ApiProvider.notificationSocket,
      headers: {},
      callback: (frame) {
        print(frame.body);
      },
    );

    final tokens = await _authLocalDataSource.getTokens();

    if (tokens.netData?.accessToken != null) {
      _stompClient?.subscribe(
        destination: ApiProvider.userNotificationSocket,
        headers: {
          'Authorization': tokens.netData!.accessToken,
        },
        callback: (frame) {
          print(frame.body);
        },
      );
    }
  }
}
