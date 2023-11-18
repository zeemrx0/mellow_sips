import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_param.g.dart';
part './app_list_param.dart';
part './test_param.dart';

part './document/get_document_param.dart';

part './auth/login_param.dart';
part './auth/register_param.dart';
part './auth/verify_registration_param.dart';
part './auth/request_otp_param.dart';

part './store/get_store_list_param.dart';
part './store/search_stores_param.dart';
part './store/get_store_menu_param.dart';
part './store/get_store_detail_param.dart';

part './product/get_product_detail_param.dart';

part './cart/add_to_cart_param.dart';
part './cart/get_cart_detail_param.dart';
part 'cart/delete_cart_param.dart';
part 'cart/delete_cart_item_param.dart';
part 'cart/update_cart_item_param.dart';

part 'order/get_order_detail_param.dart';
part 'order/create_order_param.dart';
part 'order/update_order_status_param.dart';
part 'order/search_orders_param.dart';
part 'order/get_transaction_by_order_id_param.dart';

part 'notification/subscribe_notifications_param.dart';

abstract class BaseParam {}
