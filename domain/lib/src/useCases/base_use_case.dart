import 'package:domain/domain.dart';

part './get_test_use_case.dart';
part './get_local_test_use_case.dart';
part './save_local_test_use_case.dart';

part './auth/login_use_case.dart';
part './auth/register_use_case.dart';
part './auth/verify_registration_use_case.dart';
part './auth/request_otp_use_case.dart';
part './auth/logout_use_case.dart';
part './auth/get_tokens_use_case.dart';

part './document/get_document_use_case.dart';

part './store/get_store_list_use_case.dart';
part './store/search_stores_use_case.dart';
part './store/get_store_menu_use_case.dart';
part './store/get_store_detail_use_case.dart';

part './product/get_product_detail_use_case.dart';

part './cart/get_all_cart_use_case.dart';
part './cart/add_to_cart_use_case.dart';
part './cart/get_cart_detail_use_case.dart';
part './cart/delete_cart_use_case.dart';
part './cart/delete_cart_item_use_case.dart';
part './cart/update_cart_item_use_case.dart';
part './cart/calculate_cart_with_vouchers_use_case.dart';

part './voucher/get_cart_vouchers_use_case.dart';

part './order/get_order_detail_use_case.dart';
part './order/create_order_use_case.dart';
part './order/update_order_status_use_case.dart';
part './order/search_orders_use_case.dart';
part './order/get_transaction_by_order_id_use_case.dart';

part './notification/subscribe_notifications_use_case.dart';
part './notification/unsubcribe_notifications_use_case.dart';
part './notification/search_notifications_use_case.dart';
part './notification/mark_notification_as_read_use_case.dart';
part './notification/mark_all_notification_as_read_use_case.dart';

abstract class BaseUseCase<In extends BaseParam, Out extends BaseModel> {
  Future<AppObjectResultModel<Out>> executeObject({In? param}) {
    return Future.value(
      AppObjectResultModel<Out>(netData: null),
    );
  }

  Future<AppListResultModel<Out>> executeList({In? param}) {
    return Future.value(
      AppListResultModel<Out>(netData: null),
    );
  }

  Future<AppPaginationListResultModel<Out>> executePaginationList({In? param}) {
    return Future.value(
      AppPaginationListResultModel<Out>(
        netData: null,
        hasMore: false,
        total: 0,
      ),
    );
  }
}
