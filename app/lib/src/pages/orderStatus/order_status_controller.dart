import 'package:app/src/components/features/appBar/app_bar_basic_widget.dart';
import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/page/app_main_page_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/exts/app_exts.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'order_status_page.dart';
part 'order_status_binding.dart';

class OrderStatusController extends GetxController {
  final GetOrderDetailUseCase _getOrderDetailUseCase;

  OrderStatusController(this._getOrderDetailUseCase);

  Rxn<OrderModel> order = Rxn<OrderModel>();

  Future<void> getOrderDetail() async {
    try {
      AppLoadingOverlayWidget.show();

      final result = await _getOrderDetailUseCase.executeObject(
        param: GetOrderDetailParam(
          orderId: '6e329e9e-8b29-4765-91a5-bc4bd8a5a3ae',
        ),
      );

      if (result.netData != null) {
        order.value = result.netData;
        print(order.value?.status);
      }

      AppLoadingOverlayWidget.dismiss();
    } on AppException catch (e) {
      AppLoadingOverlayWidget.dismiss();
      AppExceptionExt(appException: e).detected();
    }
  }
}
