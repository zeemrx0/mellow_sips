part of './network_service.dart';

class NetworkInterceptorWrapper extends QueuedInterceptorsWrapper {
  late final Dio diO;
  final AppSharedPref _pref = Get.find<AppSharedPref>();

  NetworkInterceptorWrapper({required this.diO});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(_headerToken());

    return handler.next(options);
  }

  Map<String, String?> _headerToken() {
    String? token = _pref.getString(AppPrefKey.accessToken, '');
    if (token == '') {
      token = null;
    }
    return {
      AppNetworkKey.authorization: token,
    };
  }
}
