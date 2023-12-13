part of 'app_nav_menu_controller.dart';

class AppNavMenuPage extends GetView<AppNavMenuController> {
  const AppNavMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.checkIsLoggedIn();

    return AppMainPageWidget()
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    if (!controller.isLoggedIn.value) {
                      Get.toNamed(Routes.welcome);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorPaddingScale(4),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: AppThemeExt.of.majorPaddingScale(6),
                        bottom: AppThemeExt.of.majorPaddingScale(4),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.of.dividerColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Obx(
                        () => Row(
                          children: [
                            R.pngs.profileAvatar.image(
                              width: AppThemeExt.of.majorScale(20),
                              height: AppThemeExt.of.majorScale(20),
                            ),
                            SizedBox(
                              width: AppThemeExt.of.majorPaddingScale(4),
                            ),
                            Expanded(
                              child: AppTextHeading4Widget()
                                  .setText(
                                      controller.profile.value?.displayName ??
                                          R.strings.logIn)
                                  .build(context),
                            ),
                            if (controller.isLoggedIn.value)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: AppThemeExt.of.majorPaddingScale(4),
                                ),
                                child: AppIconButtonWidget()
                                    .setPrefixIcon(
                                      R.svgs.icPen.svg(
                                        width: AppThemeExt.of.majorScale(6),
                                        height: AppThemeExt.of.majorScale(6),
                                      ),
                                    )
                                    .setPadding(
                                      EdgeInsets.all(
                                        AppThemeExt.of.majorPaddingScale(2),
                                      ),
                                    )
                                    .setOnPressed(
                                  () async {
                                    await Get.toNamed(Routes.updateProfile);
                                    controller.getProfile();
                                  },
                                ).build(context),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (controller.isLoggedIn.value)
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.changePassword);
                    },
                    child: Container(
                      color: AppColors.of.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorPaddingScale(4),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppThemeExt.of.majorPaddingScale(2),
                            vertical: AppThemeExt.of.majorPaddingScale(3),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.of.dividerColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: AppTextBody2Widget()
                              .setText(R.strings.changePassword)
                              .build(context),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (controller.isLoggedIn.value)
              Padding(
                padding: EdgeInsets.only(
                  left: AppThemeExt.of.majorPaddingScale(4),
                  right: AppThemeExt.of.majorPaddingScale(4),
                  bottom: AppThemeExt.of.majorPaddingScale(10),
                ),
                child: AppOutlinedButtonWidget()
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
