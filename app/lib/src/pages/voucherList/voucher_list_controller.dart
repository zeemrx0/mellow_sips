import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/voucherList/components/voucher_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './voucher_list_page.dart';
part './voucher_list_binding.dart';

class VoucherListControllerKey {
  static const String vouchers = 'vouchers';

  static const selectedVoucher = 'selectedVoucher';
}

class VoucherListController extends GetxController {
  Rx<List<VoucherModel>> vouchers = Rx<List<VoucherModel>>([]);

  void getVouchers() {
    vouchers.value =
        Get.arguments[VoucherListControllerKey.vouchers] as List<VoucherModel>;
  }
}
