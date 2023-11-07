import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/orderCartItemList/order_cart_item_list.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part './order_detail_page.dart';
part './order_detail_binding.dart';

class OrderDetailController extends GetxController {
  final GetOrderDetailUseCase _getOrderDetailUseCase;

  OrderDetailController(this._getOrderDetailUseCase);

  Rxn<OrderModel> order = Rxn<OrderModel>();

  Future<void> getOrderDetail() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getOrderDetailUseCase.executeObject(
        param: GetOrderDetailParam(
          orderId: Get.arguments as String,
        ),
      );

      order.value = result.netData;

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  String? getOrderStatus(String? orderStatus) {
    switch (orderStatus) {
      case AppOrderStatus.canceled:
        return R.strings.canceled;
      case AppOrderStatus.completed:
        return R.strings.completed;
      case AppOrderStatus.pending:
        return R.strings.pending;
      case AppOrderStatus.processing:
        return R.strings.processing;
      case AppOrderStatus.received:
        return R.strings.received;
      case AppOrderStatus.rejected:
        return R.strings.rejected;
      default:
        return null;
    }
  }
}
