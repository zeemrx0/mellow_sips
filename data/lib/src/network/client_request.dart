part of 'network_service.dart';

enum HttpMethod {
  get(value: 'GET'),
  post(value: 'POST'),
  delete(value: 'DELETE'),
  put(value: 'PUT'),
  patch(value: 'PATCH'),
  download(value: 'DOWNLOAD');

  final String value;

  const HttpMethod({required this.value});
}

class ClientRequest {
  String url;
  HttpMethod method;
  Map<String, dynamic>? queryParameters;
  Map<String, dynamic>? headers;
  dynamic body;
  String? contentType;
  ProgressCallback? onSendProgress;
  ProgressCallback? onReceiveProgress;
  bool isRequestedForList = false;

  ClientRequest({
    required this.url,
    required this.method,
    this.queryParameters,
    this.headers,
    this.body,
    this.contentType,
    this.onSendProgress,
    this.onReceiveProgress,
    this.isRequestedForList = false,
  });
}
