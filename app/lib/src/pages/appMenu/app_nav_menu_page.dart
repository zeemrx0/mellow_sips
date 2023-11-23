part of 'app_nav_menu_controller.dart';

class AppNavMenuPage extends GetView<AppNavMenuController> {
  const AppNavMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.whiteColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.orders);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppThemeExt.of.majorPaddingScale(4),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorPaddingScale(2),
                  vertical: AppThemeExt.of.majorPaddingScale(4),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.of.dividerColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    AppTextBody2Widget()
                        .setText(R.strings.orders)
                        .build(context),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppThemeExt.of.majorPaddingScale(4),
              left: AppThemeExt.of.majorPaddingScale(4),
              right: AppThemeExt.of.majorPaddingScale(4),
            ),
            child: AppFilledButtonWidget()
                .setButtonText(R.strings.logOut)
                .setOnPressed(() {
              controller.logOut();
            }).build(context),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setCanBack(true)
        .build(context);
  }
}
