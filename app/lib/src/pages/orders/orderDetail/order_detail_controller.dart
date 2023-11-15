import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/orderCartItemList/order_cart_item_list.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part './order_detail_page.dart';
part './order_detail_binding.dart';

class OrderDetailController extends GetxController {
  final GetOrderDetailUseCase _getOrderDetailUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final GetTransactionByOrderIdUseCase _getTransactionByOrderIdUseCase;

  OrderDetailController(
    this._getOrderDetailUseCase,
    this._updateOrderStatusUseCase,
    this._getTransactionByOrderIdUseCase,
  );

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

  Future<void> payOrder() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getTransactionByOrderIdUseCase.executeObject(
        param: GetTransactionByOrderIdParam(
          orderId: order.value!.id,
        ),
      );

      AppLoadingOverlayWidget.dismiss();

      if (result.netData != null) {
        FlutterZaloPayStatus zaloPayStatus = await FlutterZaloPaySdk.payOrder(
          zpToken: result.netData!.externalPaymentInfo!.zpTransToken,
        );

        if (zaloPayStatus == FlutterZaloPayStatus.success ||
            zaloPayStatus == FlutterZaloPayStatus.processing) {
          order.refresh();
        } else {
          AppDefaultDialogWidget()
              .setTitle(R.strings.paymentFailed)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setOnPositive(() {
                Get.back();
              })
              .buildDialog(Get.context!)
              .show();
        }
      }
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> cancelOrder() async {
    try {
      AppLoadingOverlayWidget.show();

      await _updateOrderStatusUseCase.executeObject(
        param: UpdateOrderStatusParam(
          orderId: order.value!.id,
          status: AppOrderStatusUpdateAction.cancel,
        ),
      );

      order.refresh();

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
      case AppOrderStatus.ordered:
        return R.strings.ordered;
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
      case AppOrderStatus.expired:
        return R.strings.expired;
      default:
        return null;
    }
  }
}
