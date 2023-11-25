import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/orderCartItemList/order_cart_item_list.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';
import 'package:vibration/vibration.dart';

part './order_completed_alert_page.dart';
part './order_completed_alert_binding.dart';

class OrderCompletedAlertController extends GetxController {
  final GetOrderDetailUseCase _getOrderDetailUseCase;

  final player = AudioPlayer();
  final isAlerting = false.obs;

  OrderCompletedAlertController(this._getOrderDetailUseCase);

  Rxn<OrderModel> order = Rxn<OrderModel>();
  Rxn<VoucherOrderModel> businessVoucherOrder = Rxn<VoucherOrderModel>();
  Rxn<VoucherOrderModel> systemVoucherOrder = Rxn<VoucherOrderModel>();

  @override
  dispose() async {
    await stopAlert();
    super.dispose();
  }

  Future<void> getOrderDetail(String orderId) async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getOrderDetailUseCase.executeObject(
        param: GetOrderDetailParam(
          orderId: orderId,
        ),
      );

      order.value = result.netData;

      businessVoucherOrder.value =
          result.netData?.voucherOrders?.firstWhereOrNull(
        (element) => element.source == AppConstants.business,
      );
      systemVoucherOrder.value = result.netData?.voucherOrders?.firstWhereOrNull(
        (element) => element.source == AppConstants.system,
      );

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> alert() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;

    if (hasVibrator) {
      Vibration.vibrate(pattern: [100, 200, 400], amplitude: 255, repeat: 1);
    }

    player.setReleaseMode(ReleaseMode.loop);
    player.play(AssetSource('audio/bf_fnf_beep.mp3'));

    isAlerting.value = true;
  }

  Future<void> stopAlert() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;

    if (hasVibrator) {
      Vibration.cancel();
    }

    player.stop();

    isAlerting.value = false;
  }
}
