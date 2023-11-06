part of 'app_exts.dart';

class AppConstants {
  AppConstants._();
}

class AppRoutesParamKey {
  static String id = 'id';
}

class AppPaymentMethod {
  static const String zalopay = 'ZALO_PAY';
  static const String cash = 'CASH';
}

class AppOrderStatusUpdateAction {
  static const String cancel = 'cancel';
}
