part of 'app_nav_menu_controller.dart';

class AppNavMenuPage extends GetView<AppNavMenuController> {
  const AppNavMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkIsLoggedIn();

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
    return SafeArea(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppThemeExt.of.majorPaddingScale(4),
                left: AppThemeExt.of.majorPaddingScale(4),
                right: AppThemeExt.of.majorPaddingScale(4),
              ),
              child: AppFilledButtonWidget()
                  .setButtonText(controller.isLoggedIn.value
                      ? R.strings.logOut
                      : R.strings.logIn)
                  .setOnPressed(
                () {
                  if (controller.isLoggedIn.value) {
                    controller.logOut();
                  } else {
                    Get.toNamed(Routes.welcome);
                  }
                },
              ).build(context),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(false)
        .build(context);
  }
}
