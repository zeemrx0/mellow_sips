part of './order_list_controller.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .setBottomNavigationBar(
            const AppBottomNavigationBarWidget().build(context))
        .setFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerDocked,
        )
        .setFloatingActionButton(
          const FloatingAppButton(),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
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
