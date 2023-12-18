part of './order_list_controller.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _appBar(context),
        Expanded(
            child: AppTabBarTextOnlyLv2Widget().setTabTitleList([
          R.strings.waitingForConfirm,
          R.strings.preparing,
          R.strings.completed,
          R.strings.received,
          R.strings.cancelled,
        ]).setTabViewList([
          const WaitingForConfirmOrderListView(),
          const PreparingOrderListView(),
          const CompletedOrderListView(),
          const ReceivedOrderListView(),
          const CancelledOrderListView(),
        ]).build(context)),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.orders)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(false)
        .build(context);
  }
}
