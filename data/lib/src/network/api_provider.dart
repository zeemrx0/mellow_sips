part of 'network_service.dart';

class ApiProvider {
  static const test = '/test';
}

class StatusCode extends HttpStatus {
  StatusCode(super.code);

  static const int code999 = 999;
}

class ErrorCode {
  ErrorCode._();

  static const String dioError = 'DioError';
  static const String networkServiceError = 'NetworkServiceError';
}
