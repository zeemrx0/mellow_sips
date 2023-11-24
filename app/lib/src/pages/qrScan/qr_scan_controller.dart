import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:resources/resources.dart';

part 'qr_scan_page.dart';
part 'qr_scan_binding.dart';

class QrScanControllerKey {
  static const String storeId = 'storeId';
  static const String qrId = 'qrId';
}

class QrScanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrViewController;
  Rxn<Barcode> qr = Rxn<Barcode>();
  final isScan = true.obs;
  final FocusNode codeTextFieldFocusNode = FocusNode();

  Rxn<OrderModel> order = Rxn<OrderModel>();
  RxString qrCode = ''.obs;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen(
      (scanData) async {
        if (scanData.code != null &&
            scanData.code!.startsWith('https://mellowsipssv.site/mobile')) {
          final url = Uri.parse(scanData.code!);

          final storeId = url.queryParameters[QrScanControllerKey.storeId];

          Get.offNamed(Routes.storeDetail, arguments: storeId);

          await controller.pauseCamera();
        }
      },
    );
  }
}
