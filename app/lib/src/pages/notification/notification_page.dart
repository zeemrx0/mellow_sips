part of 'notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
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

  Widget _buildNotificationItem(
    BuildContext context,
    NotificationModel notification,
    int index,
  ) {
    return InkWell(
      onTap: () {
        if (notification.metadata != null &&
            notification.metadata!.containsKey(AppConstants.orderId)) {
          Get.toNamed(
            Routes.orderDetail,
            arguments: notification.metadata![AppConstants.orderId],
          );
        }

        if (!notification.isSeen) {
          controller.markAsRead(notification.id);
        }
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
              vertical: AppThemeExt.of.majorPaddingScale(10 / 4),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextBody2Widget()
                          .setText(
                              controller.getNotificationSubject(notification))
                          .setTextStyle(notification.isSeen
                              ? AppTextStyleExt.of.textBody2r
                              : AppTextStyleExt.of.textBody2s)
                          .build(context),
                      SizedBox(
                        height: AppThemeExt.of.majorScale(1),
                      ),
                      AppTextCaption1Widget()
                          .setText(
                            DateTimeExt.displayDateTime(
                              dateTime: notification.createdAt
                                      .toString()
                                      .endsWith('Z')
                                  ? notification.createdAt!
                                      .add(const Duration(hours: 7))
                                  : notification.createdAt!,
                            ),
                          )
                          .setColor(AppColors.of.subTextColor)
                          .build(context),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(2),
                ),
                !notification.isSeen
                    ? Container(
                        width: AppThemeExt.of.majorScale(6 / 4),
                        height: AppThemeExt.of.majorScale(6 / 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.of.primaryColor[400],
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<NotificationModel, NotificationController>(
            childBuilder: _buildNotificationItem,
            padding: EdgeInsets.symmetric(
              vertical: AppThemeExt.of.majorPaddingScale(2),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.notifications)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setTrailing(
          AppIconButtonWidget()
              .setPrefixIcon(
            R.svgs.icCheck.svg(
              width: AppThemeExt.of.majorScale(6),
              height: AppThemeExt.of.majorScale(6),
            ),
          )
              .setOnPressed(
            () {
              controller.markAllAsRead();
            },
          ).build(context),
        )
        .setCanBack(false)
        .build(context);
  }
}
