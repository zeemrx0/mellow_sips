import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/dialog/app_dialog_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/textField/app_text_field_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/pages/voucherList/components/voucher_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part './voucher_list_page.dart';
part './voucher_list_binding.dart';

class VoucherListControllerKey {
  static const String vouchers = 'vouchers';
  static const String selectedVoucher = 'selectedVoucher';
  static const String voucherCode = 'voucherCode';
}

class VoucherListController extends GetxController {
  final CalculateCartWithVouchersUseCase _calculateCartWithVouchersUseCase;

  VoucherListController(
    this._calculateCartWithVouchersUseCase,
  );

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  Rx<List<VoucherModel>> vouchers = Rx<List<VoucherModel>>([]);

  void getVouchers() {
    vouchers.value =
        Get.arguments[VoucherListControllerKey.vouchers] as List<VoucherModel>;
  }

  Future<void> applyVoucher() async {
    try {
      AppLoadingOverlayWidget.show();

      formKey.currentState?.save();

      final inputVoucherCode =
          formKey.currentState?.fields['voucherCode']?.value as String;

      final result = await _calculateCartWithVouchersUseCase.executeObject(
        param: CalculateCartWithVouchersParam(
          cartId: Get.arguments[AppConstants.cartId] as String,
          vouchers: [inputVoucherCode],
        ),
      );

      VoucherModel? resultVoucher;

      if (result.netData != null) {
        for (final voucher in result.netData!.vouchers) {
          if (voucher.code == inputVoucherCode) {
            resultVoucher = voucher;
            break;
          }
        }
      }

      if (resultVoucher != null) {
        Get.back(
          result: resultVoucher,
        );
      } else {
        AppDefaultDialogWidget()
            .setTitle(R.strings.voucherIsNotAvailable)
            .setAppDialogType(AppDialogType.error)
            .setPositiveText(R.strings.confirm)
            .buildDialog(Get.context!)
            .show();
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
