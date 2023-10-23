part of 'order_status_controller.dart';

class OrderStatusPage extends GetView<OrderStatusController> {
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getOrderDetail();
    
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText('Tình trạng đơn hàng')
              .setTextStyle(
                AppTextStyleExt.of.textBody1s?.copyWith(
                  fontFamily: R.fontFamily.workSans,
                ),
              )
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _undoneStep(context, 'Chờ nhận đơn'),
          _connectionLine(context),
          _inProgressStep(context, 'Đang chuẩn bị'),
          _connectionLine(context),
          _undoneStep(context, 'Hoàn thành'),
        ],
      ),
    );
  }

  Widget _connectionLine(BuildContext context) {
    return Container(
      width: 1,
      margin: EdgeInsets.only(
        left: AppThemeExt.of.majorScale(4) - 0.5,
      ),
      height: AppThemeExt.of.majorScale(14),
      color: AppColors.of.primaryColor[300],
    );
  }

  Widget _undoneStep(BuildContext context, String title) {
    return Container(
      height: AppThemeExt.of.majorScale(4),
      padding: EdgeInsets.only(
        left: AppThemeExt.of.majorScale(2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppThemeExt.of.majorScale(4),
            height: AppThemeExt.of.majorScale(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.of.primaryColor[300],
            ),
          ),
          SizedBox(
            width: AppThemeExt.of.majorScale(4),
          ),
          AppTextBody1Widget()
              .setText(title)
              .setTextStyle(
                AppTextStyleExt.of.textBody1r?.copyWith(
                  fontFamily: R.fontFamily.workSans,
                  height: 1,
                ),
              )
              .build(context),
        ],
      ),
    );
  }

  Widget _inProgressStep(BuildContext context, String title) {
    return SizedBox(
      height: AppThemeExt.of.majorScale(8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(
              AppThemeExt.of.majorScale(1),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColors.of.primaryColor,
              border: Border.all(
                color: AppColors.of.primaryColor,
                width: 1,
              ),
            ),
            child: Container(
              width: AppThemeExt.of.majorScale(6),
              height: AppThemeExt.of.majorScale(6),
              padding: EdgeInsets.all(
                AppThemeExt.of.majorScale(2),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.of.primaryColor,
              ),
            ),
          ),
          SizedBox(
            width: AppThemeExt.of.majorScale(4),
          ),
          AppTextHeading4Widget().setText(title).build(context),
        ],
      ),
    );
  }
}
