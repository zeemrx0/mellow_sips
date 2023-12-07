part of 'network_service.dart';

class ApiProvider {
  static const test = '/test';

  // APIs
  static const api = '/api';

  static const auth = '$api/auth';
  static const login = '$auth/login';
  static const register = '$auth/register';
  static const verifyRegistration = '$auth/verify';
  static const profile = '$auth/me/profile';

  static const requestOTP = '$auth/resend-confirmation-code';

  static const documents = '$api/documents';

  static const stores = '$api/stores';
  static const searchStores = '$stores/customer/search';

  static const products = '$api/products';
  static const productDetail = '$products/details';

  static const carts = '$api/carts';
  static const cartItems = '$carts/items';

  static const orders = '$api/orders';

  static const notifications = '$api/notifications';
  static const searchNotifications = '$notifications/search';

  static const reviews = '$api/reviews';

  static const dashboard = '$api/dashboard';
  static const customerDashboard = '$dashboard/customer';


  // Web Sockets
  static const notificationSocket = '/topic/notifications';
  static const userNotificationSocket = '/user/topic/notifications';
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
