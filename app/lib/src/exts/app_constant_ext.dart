part of 'app_exts.dart';

class AppConstants {
  AppConstants._();

  static const String order = 'order';
  static const String createdAt = 'createdAt';
  static const String desc = 'DESC';
  static const String subject = 'subject';
  static const String key = 'key';
  static const String cash = 'CASH';
  static const String percent = 'PERCENT';
  static const String orderCompleted = 'ORDER_COMPLETED';
  static const String business = 'BUSINESS';
  static const String system = 'SYSTEM';
  static const String metadata = 'metadata';
  static const String orderId = 'orderId';
  static const String storeId = 'storeId';
  static const String productId = 'productId';
  static const String action = 'action';
  static const String navigateToProduct = 'NAVIGATE_TO_PRODUCT';
  static const String isEditing = 'isEditing';
}

class CartParamKey {
  static const String cartId = 'cartId';
  static const String cartItemId = 'cartItemId';
  static const String productId = 'productId';
  static const String quantity = 'quantity';
  static const String note = 'note';
  static const String addons = 'addons';
}

class AppRoutesParamKey {
  static const String id = 'id';
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
  static const String expired = 'EXPIRED';
}

class NotificationKey {
  static const String orderCompleted = 'ORDER_COMPLETED';
  static const String orderProcessing = 'ORDER_PROCESSING';
}
