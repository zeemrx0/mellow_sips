part of 'network_service.dart';

class ApiProvider {
  static const test = '/test';

  static const auth = '/auth';
  static const login = '$auth/login';
  static const register = '$auth/register';
  static const verifyRegistration = '$auth/verify';
  static const requestOTP = '$auth/resend-confirmation-code';

  static const documents = '/documents';

  static const stores = '/stores';
  static const searchStores = '$stores/customer/search';
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
