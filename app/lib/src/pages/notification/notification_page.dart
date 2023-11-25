part of 'notification_controller.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

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
        controller.markAsRead(notification.id);
      },
      child: Container(
        color: notification.isSeen
            ? AppColors.of.backgroundColor
            : AppColors.of.whiteColor,
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
                    .setText(controller.getNotificationSubject(notification))
                    .setTextStyle(notification.isSeen
                        ? AppTextStyleExt.of.textBody2r
                        : AppTextStyleExt.of.textBody2s)
                    .build(context),
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
        Container(
          color: AppColors.of.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  controller.markAllAsRead();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemeExt.of.majorPaddingScale(3),
                    vertical: AppThemeExt.of.majorPaddingScale(4),
                  ),
                  child: AppTextCaption1Widget()
                      .setText(R.strings.markAllAsRead)
                      .setTextStyle(AppTextStyleExt.of.textCaption1s)
                      .setColor(AppColors.of.primaryColor)
                      .build(context),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: AppListViewWidget<NotificationModel, NotificationController>(
            childBuilder: _buildNotificationItem,
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
        .setCanBack(false)
        .build(context);
  }
}
