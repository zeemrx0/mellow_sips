import 'package:app/src/components/main/listView/app_list_view_controller.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/components/order_item_widget.dart';
import 'package:app/src/pages/bottomNavPage/views/orderList/controllers/received_order_list_controller.dart';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ReceivedOrderListView extends StatelessWidget {
  const ReceivedOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.of.backgroundColor,
      child: AppListViewWidget<OrderModel, ReceivedOrderListController>(
        padding: EdgeInsets.only(
          top: AppThemeExt.of.majorPaddingScale(2),
        ),
        childBuilder: (p0, model, index) => OrderItemWidget(order: model),
      ),
    );
  }
}
