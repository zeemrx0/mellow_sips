import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/features/orderCartItemList/order_cart_item_list.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part './checkout_page.dart';
part './checkout_binding.dart';

class CheckoutControllerKey {
  static const String cartId = 'cartId';
  static const String initialTransactionMethod = 'initialTransactionMethod';
  static const String vouchers = 'vouchers';
  static const String chosenVoucher = 'chosenVoucher';
}

class CheckoutController extends GetxController {
  final GetCartDetailUseCase _getCartDetailUseCase;
  final GetCartVouchersUseCase _getCartVouchersUseCase;

  CheckoutController(
    this._getCartDetailUseCase,
    this._getCartVouchersUseCase,
  );

  Rxn<CartModel> cart = Rxn<CartModel>();
  Rxn<VouchersModel> vouchers = Rxn<VouchersModel>();
  Rx<String> transactionMethod = (AppPaymentMethod.zalopay).obs;
  Rxn<VoucherModel> businessVoucher = Rxn<VoucherModel>();
  Rxn<VoucherModel> systemVoucher = Rxn<VoucherModel>();

  Future<void> getCart() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getCartDetailUseCase.executeObject(
        param: GetCartDetailParam(cartId: Get.arguments as String),
      );

      if (result.netData != null) {
        cart.value = result.netData;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }

  Future<void> getCartVouchers() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getCartVouchersUseCase.executeObject(
        param: GetCartVouchersParam(cartId: Get.arguments as String),
      );

      if (result.netData != null) {
        vouchers.value = result.netData;
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
