import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_raw.g.dart';
part './app_result_raw.dart';
part './test_raw.dart';
part './tokens_raw.dart';

part './document/document_raw.dart';

part './store/store_raw.dart';
part './store/product_raw.dart';
part './store/menu_section_raw.dart';
part './store/menu_raw.dart';
part './store/product_option_section_raw.dart';
part './store/product_addon_raw.dart';
part './store/store_review_raw.dart';
part './store/review_statistic_raw.dart';

part './cart/cart_raw.dart';
part './cart/cart_item_raw.dart';

part './vouchers/voucher_raw.dart';
part './vouchers/vouchers_raw.dart';
part './vouchers/voucher_order_raw.dart';

part './order/order_raw.dart';
part './order/order_transaction_raw.dart';
part './order/order_external_payment_info_raw.dart';
part './order/order_details_raw.dart';

part './notification/notification_raw.dart';

abstract class BaseRaw<BM extends BaseModel> {
  BM toModel();
}

class EmptyRaw extends BaseRaw<EmptyModel> {
  @override
  EmptyModel toModel() {
    return EmptyModel();
  }
}
