import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:resources/resources.dart';

part 'confirm_order_page.dart';
part 'confirm_order_binding.dart';

class ConfirmOrderController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  Rxn<Barcode> qr = Rxn<Barcode>();

  final isScan = true.obs;

  final FocusNode codeTextFieldFocusNode = FocusNode();

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

    print(isScan);
  }

  void switchToEnterCode() {
    isScan.value = false;
    isScan.refresh();

    codeTextFieldFocusNode.requestFocus();
  }
}
