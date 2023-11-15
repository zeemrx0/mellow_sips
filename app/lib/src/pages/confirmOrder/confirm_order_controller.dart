import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:resources/resources.dart';

part 'confirm_order_page.dart';
part 'confirm_order_binding.dart';

class ConfirmOrderControllerKey {
  static const String cartId = 'cartId';
  static const String initialTransactionMethod = 'initialTransactionMethod';
  static const String qrCode = 'qrCode';
  static const String qrId = 'qrId';
}

class ConfirmOrderController extends GetxController {
  final CreateOrderUseCase _createOrderUseCase;

  ConfirmOrderController(
    this._createOrderUseCase,
  );

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  Rxn<Barcode> qr = Rxn<Barcode>();
  final isScan = true.obs;
  final FocusNode codeTextFieldFocusNode = FocusNode();

  Rxn<OrderModel> order = Rxn<OrderModel>();
  RxString qrCode = ''.obs;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      qr.value = scanData;
      print(qr.value?.code);
    });
  }

  void switchToScanCode() {
    isScan.value = true;
    isScan.refresh();
  }

  void switchToEnterCode() {
    isScan.value = false;
    isScan.refresh();

    codeTextFieldFocusNode.requestFocus();
  }

  Future<void> createOrder({
    String? qrCode,
    String? qrId,
  }) async {
    try {
      AppLoadingOverlayWidget.show();

      final cartId = Get.arguments[ConfirmOrderControllerKey.cartId] as String;
      final initialTransactionMethod =
          Get.arguments[ConfirmOrderControllerKey.initialTransactionMethod]
              as String;

      final result = await _createOrderUseCase.executeObject(
        param: CreateOrderParam(
          cartId: cartId,
          initialTransactionMethod: initialTransactionMethod,
          qrCode: qrCode,
          qrId: qrId,
        ),
      );

      print("Confirm!! + ${result.netData}");

      if (result.netData != null) {
        order.value = result.netData;

        switch (initialTransactionMethod) {
          case AppPaymentMethod.cash:
            Get.offNamedUntil(
              Routes.orderDetail,
              (route) {
                return route.settings.name == Routes.home;
              },
              arguments: order.value!.id,
            );
            break;
          case AppPaymentMethod.zalopay:
            FlutterZaloPayStatus zaloPayStatus =
                await FlutterZaloPaySdk.payOrder(
              zpToken: order
                  .value!.latestTransaction!.externalPaymentInfo!.zpTransToken,
            );

            if (zaloPayStatus == FlutterZaloPayStatus.success ||
                zaloPayStatus == FlutterZaloPayStatus.processing) {
              Get.offNamedUntil(
                Routes.orderDetail,
                (route) {
                  return route.settings.name == Routes.home;
                },
                arguments: order.value!.id,
              );
            } else {
              AppDefaultDialogWidget()
                  .setTitle(R.strings.paymentFailed)
                  .setAppDialogType(AppDialogType.error)
                  .setPositiveText(R.strings.confirm)
                  .setOnPositive(() {
                    Get.offAllNamed(Routes.orderDetail,
                        arguments: order.value!.id);
                  })
                  .buildDialog(Get.context!)
                  .show();
            }
            break;
        }
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
