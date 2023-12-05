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
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part './order_detail_page.dart';
part './order_detail_binding.dart';

class OrderDetailController extends GetxController {
  final GetOrderDetailUseCase _getOrderDetailUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final GetTransactionByOrderIdUseCase _getTransactionByOrderIdUseCase;
  final CreateStoreReviewUseCase _createStoreReviewUseCase;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  OrderDetailController(
    this._getOrderDetailUseCase,
    this._updateOrderStatusUseCase,
    this._getTransactionByOrderIdUseCase,
    this._createStoreReviewUseCase,
  );

  Rxn<OrderModel> order = Rxn<OrderModel>();
  Rxn<VoucherOrderModel> businessVoucherOrder = Rxn<VoucherOrderModel>();
  Rxn<VoucherOrderModel> systemVoucherOrder = Rxn<VoucherOrderModel>();
  Rxn<int> stars = Rxn<int>();

  Future<void> getOrderDetail() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getOrderDetailUseCase.executeObject(
        param: GetOrderDetailParam(
          orderId: Get.arguments as String,
        ),
      );

      order.value = result.netData;

      businessVoucherOrder.value =
          result.netData?.voucherOrders?.firstWhereOrNull(
        (element) => element.source == AppConstants.business,
      );
      systemVoucherOrder.value =
          result.netData?.voucherOrders?.firstWhereOrNull(
        (element) => element.source == AppConstants.system,
      );

      AppLoadingOverlayWidget.dismiss();
      _refreshController.refreshToIdle();
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
    AppDefaultDialogWidget()
        .setTitle(R.strings.cancelOrder)
        .setAppDialogType(AppDialogType.confirm)
        .setPositiveText(R.strings.confirm)
        .setOnPositive(() async {
          try {
            AppLoadingOverlayWidget.show();

            await _updateOrderStatusUseCase.executeObject(
              param: UpdateOrderStatusParam(
                orderId: order.value!.id,
                status: AppOrderStatusUpdateAction.cancel,
              ),
            );

            getOrderDetail();

            AppLoadingOverlayWidget.dismiss();
          } on AppException catch (e) {
            AppLoadingOverlayWidget.dismiss();
            AppExceptionExt(appException: e).detected();
          }
        })
        .setNegativeText(R.strings.close)
        .buildDialog(Get.context!)
        .show();
  }

  Future<void> sendReview() async {
    try {
      AppLoadingOverlayWidget.show();

      await _createStoreReviewUseCase.executeObject(
        param: CreateStoreReviewParam(
          orderId: order.value!.id,
          point: stars.value ?? 0,
          comment: '',
        ),
      );

      AppLoadingOverlayWidget.dismiss();

      getOrderDetail();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  String? getOrderStatus(String? orderStatus) {
    switch (orderStatus) {
      case AppOrderStatus.cancelled:
        return R.strings.cancelled;
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

  Color getOrderStatusColor(String? orderStatus) {
    switch (orderStatus) {
      case AppOrderStatus.cancelled:
        return AppColors.of.redColor[700]!;
      case AppOrderStatus.ordered:
        return AppColors.of.orangeColor;
      case AppOrderStatus.completed:
        return AppColors.of.greenColor[500]!;
      case AppOrderStatus.pending:
        return AppColors.of.blueColor[500]!;
      case AppOrderStatus.processing:
        return AppColors.of.blueColor[700]!;
      case AppOrderStatus.received:
        return AppColors.of.greenColor[700]!;
      case AppOrderStatus.rejected:
        return AppColors.of.redColor[500]!;
      case AppOrderStatus.expired:
        return AppColors.of.redColor[600]!;
      default:
        return AppColors.of.subTextColor;
    }
  }
}
