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
            InkWell(
              onTap: () {
                if (!controller.isLoggedIn.value) {
                  Get.toNamed(Routes.welcome);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorPaddingScale(4),
                ),
                child: Row(
                  children: [
                    R.pngs.profileAvatar.image(
                      width: AppThemeExt.of.majorScale(20),
                      height: AppThemeExt.of.majorScale(20),
                    ),
                    SizedBox(
                      width: AppThemeExt.of.majorPaddingScale(4),
                    ),
                    AppTextHeading4Widget()
                        .setText(
                          controller.isLoggedIn.value
                              ? 'Huỳnh Quốc Duy'
                              : R.strings.logIn,
                        )
                        .build(context),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppThemeExt.of.majorScale(8),
            ),
            if (controller.isLoggedIn.value)
              Padding(
                padding: EdgeInsets.only(
                  left: AppThemeExt.of.majorPaddingScale(4),
                  right: AppThemeExt.of.majorPaddingScale(4),
                ),
                child: AppFilledButtonWidget()
                    .setButtonText(R.strings.logOut)
                    .setOnPressed(
                  () {
                    controller.logOut();
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
