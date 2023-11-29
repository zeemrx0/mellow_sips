import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = AppThemeExt.of.majorScale(6);

    final activeRoute = Get.currentRoute;

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
      child: BottomAppBar(
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
                icon: activeRoute == Routes.home
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
                isActive: activeRoute == Routes.home,
                onPressed: () {
                  Get.offNamed(Routes.home);
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: AppThemeExt.of.majorScale(10),
                ),
                child: _bottomNavigationItem(
                  context,
                  icon: activeRoute == Routes.orders
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
                  isActive: activeRoute == Routes.orders,
                  onPressed: () {
                    Get.offNamed(Routes.orders);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppThemeExt.of.majorScale(10),
                ),
                child: _bottomNavigationItem(
                  context,
                  icon: activeRoute == Routes.notifications
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
                  isActive: activeRoute == Routes.notifications,
                  onPressed: () {
                    Get.offNamed(Routes.notifications);
                  },
                ),
              ),
              _bottomNavigationItem(
                context,
                icon: activeRoute == Routes.appNavMenu
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
                isActive: activeRoute == Routes.appNavMenu,
                onPressed: () {
                  Get.offNamed(Routes.appNavMenu);
                },
              ),
            ],
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
        width: (MediaQuery.of(Get.context!).size.width -
                AppThemeExt.of.majorScale(20)) /
            4,
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
