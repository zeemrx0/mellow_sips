part of './app_bottom_navigation_bar_controller.dart';

class AppBottomNavigationBarWidget
    extends GetView<AppBottomNavigationBarController> {
  final PageController pageController;

  const AppBottomNavigationBarWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = AppThemeExt.of.majorScale(6);

    return Container(
      height: AppThemeExt.of.majorScale(48 / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            AppThemeExt.of.majorScale(4),
          ),
          topRight: Radius.circular(
            AppThemeExt.of.majorScale(4),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.of.grayColor[950]!.withOpacity(0.08),
            blurRadius: AppThemeExt.of.majorScale(4),
            offset: Offset(0, -1 * AppThemeExt.of.majorScale(1 / 4)),
          ),
        ],
      ),
      child: Obx(
        () => BottomAppBar(
          padding: EdgeInsets.zero,
          color: AppColors.of.whiteColor,
          surfaceTintColor: AppColors.of.whiteColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: AppThemeExt.of.majorScale(2),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: EdgeInsets.only(
              top: AppThemeExt.of.majorScale(6 / 4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                _bottomNavigationItem(
                  context,
                  icon: controller.page.value == 0
                      ? R.svgs.icHome.svg(
                          width: iconSize,
                          height: iconSize,
                          colorFilter: ColorFilter.mode(
                            AppColors.of.primaryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : R.svgs.icHomeOutline.svg(
                          width: iconSize,
                          height: iconSize,
                          colorFilter: ColorFilter.mode(
                            AppColors.of.disabledColor,
                            BlendMode.srcIn,
                          ),
                        ),
                  label: R.strings.home,
                  isActive: controller.page.value == 0,
                  onPressed: () {
                    pageController.jumpToPage(0);
                    controller.page.value = 0;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: AppThemeExt.of.majorScale(10),
                  ),
                  child: _bottomNavigationItem(
                    context,
                    icon: controller.page.value == 1
                        ? R.svgs.icOrder.svg(
                            width: iconSize,
                            height: iconSize,
                            colorFilter: ColorFilter.mode(
                              AppColors.of.primaryColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : R.svgs.icOrderOutline.svg(
                            width: iconSize,
                            height: iconSize,
                            colorFilter: ColorFilter.mode(
                              AppColors.of.disabledColor,
                              BlendMode.srcIn,
                            ),
                          ),
                    label: R.strings.orders,
                    isActive: controller.page.value == 1,
                    onPressed: () {
                      pageController.jumpToPage(1);
                      controller.page.value = 1;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppThemeExt.of.majorScale(10),
                  ),
                  child: _bottomNavigationItem(
                    context,
                    icon: controller.page.value == 2
                        ? R.svgs.icBell.svg(
                            width: iconSize,
                            height: iconSize,
                            colorFilter: ColorFilter.mode(
                              AppColors.of.primaryColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : R.svgs.icBellOutline.svg(
                            width: iconSize,
                            height: iconSize,
                            colorFilter: ColorFilter.mode(
                              AppColors.of.disabledColor,
                              BlendMode.srcIn,
                            ),
                          ),
                    label: R.strings.notifications,
                    isActive: controller.page.value == 2,
                    onPressed: () {
                      pageController.jumpToPage(2);
                      controller.page.value = 2;
                    },
                  ),
                ),
                _bottomNavigationItem(
                  context,
                  icon: controller.page.value == 3
                      ? R.svgs.icPerson.svg(
                          width: iconSize,
                          height: iconSize,
                          colorFilter: ColorFilter.mode(
                            AppColors.of.primaryColor,
                            BlendMode.srcIn,
                          ),
                        )
                      : R.svgs.icPersonOutline.svg(
                          width: iconSize,
                          height: iconSize,
                          colorFilter: ColorFilter.mode(
                            AppColors.of.disabledColor,
                            BlendMode.srcIn,
                          ),
                        ),
                  label: R.strings.profile,
                  isActive: controller.page.value == 3,
                  onPressed: () {
                    pageController.jumpToPage(3);
                    controller.page.value = 3;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationItem(
    BuildContext context, {
    required Widget icon,
    required String label,
    required bool isActive,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: AppThemeExt.of.majorScale(16),
        child: Column(
          children: [
            icon,
            SizedBox(
              height: AppThemeExt.of.majorScale(1 / 2),
            ),
            AppTextCaption2Widget()
                .setText(label)
                .setColor(isActive
                    ? AppColors.of.primaryColor
                    : AppColors.of.disabledColor)
                .setTextStyle(isActive
                    ? AppTextStyleExt.of.textCaption2s
                    : AppTextStyleExt.of.textCaption2r)
                .build(context),
          ],
        ),
      ),
    );
  }
}
