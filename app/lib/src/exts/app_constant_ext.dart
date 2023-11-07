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

class AppOrderStatus {
  static const String pending = 'PENDING';
  static const String ordered = 'ORDERED';
  static const String canceled = 'CANCELED';
  static const String rejected = 'REJECTED';
  static const String processing = 'PROCESSING';
  static const String completed = 'COMPLETED';
  static const String received = 'RECEIVED';
  static const String declined = 'DECLINED';
}