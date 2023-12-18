part of './bottom_nav_controller.dart';

class BottomNavPage extends GetView<BottomNavController> {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.subscribeNotifications();

    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .setBottomNavigationBar(
          AppBottomNavigationBarWidget(
            pageController: controller.pageController,
          ),
        )
        .setFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerDocked,
        )
        .setFloatingActionButton(
          const FloatingAppButton(),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    final pages = [
      const HomePage(),
      const OrderListPage(),
      const NotificationPage(),
      const AppNavMenuPage(),
    ];

    return Column(
      children: [
        Expanded(
          child: PageView(
            // physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: pages,
          ),
        )
      ],
    );
  }
}
