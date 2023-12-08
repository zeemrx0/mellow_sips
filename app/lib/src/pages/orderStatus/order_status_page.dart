part of 'order_status_controller.dart';

enum StepStatus {
  undone,
  inProgress,
  done,
}

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
              .setText(R.strings.orderStatus)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setLeading(
          AppIconButtonWidget()
              .setPrefixIcon(
            R.svgs.icLongArrowLeft.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            ),
          )
              .setOnPressed(
            () {
              Get.offAllNamed(Routes.stores);
            },
          ).build(context),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Obx(
        () => Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(Get.context!).size.width / 2 -
                2 * AppThemeExt.of.majorScale(4) -
                AppThemeExt.of.majorScale(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _step(
                context,
                title: R.strings.waitingForPayment,
                stepStatus:
                    controller.order.value?.status == AppOrderStatus.pending
                        ? StepStatus.inProgress
                        : StepStatus.undone,
              ),
              _connectionLine(context),
              _step(
                context,
                title: R.strings.waitingForConfirm,
                stepStatus:
                    controller.order.value?.status == AppOrderStatus.ordered
                        ? StepStatus.inProgress
                        : StepStatus.undone,
              ),
              _connectionLine(context),
              _step(
                context,
                title: R.strings.preparing,
                stepStatus:
                    controller.order.value?.status == AppOrderStatus.processing
                        ? StepStatus.inProgress
                        : StepStatus.undone,
              ),
              _connectionLine(context),
              _step(
                context,
                title: R.strings.completed,
                stepStatus:
                    controller.order.value?.status == AppOrderStatus.completed
                        ? StepStatus.inProgress
                        : StepStatus.undone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _connectionLine(BuildContext context) {
    return Container(
      width: 1,
      margin: EdgeInsets.only(
        left: AppThemeExt.of.majorScale(4) - 0.5,
      ),
      height: AppThemeExt.of.majorScale(12),
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

  Widget _step(
    BuildContext context, {
    required String title,
    required StepStatus stepStatus,
  }) {
    if (stepStatus == StepStatus.undone) {
      return _undoneStep(context, title);
    } else if (stepStatus == StepStatus.inProgress) {
      return _inProgressStep(context, title);
    } else {
      return _undoneStep(context, title);
    }
  }
}
