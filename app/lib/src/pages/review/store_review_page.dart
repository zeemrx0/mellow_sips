part of './store_review_controller.dart';

class StoreReviewPage extends GetView<StoreReviewController> {
  const StoreReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _buildNotificationItem(
    BuildContext context,
    StoreReviewModel storeReview,
    int index,
  ) {
    return Container(
      color: AppColors.of.whiteColor,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        R.svgs.icStarYellow.svg(
                          width: AppThemeExt.of.majorScale(4),
                          height: AppThemeExt.of.majorScale(4),
                        ),
                        SizedBox(
                          width: AppThemeExt.of.majorScale(2),
                        ),
                        AppTextBody2Widget()
                            .setText(storeReview.point.toString())
                            .build(context),
                      ],
                    ),
                    SizedBox(
                      height: AppThemeExt.of.majorScale(3),
                    ),
                    AppTextBody2Widget()
                        .setText(storeReview.comment)
                        .build(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<StoreReviewModel, StoreReviewController>(
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
              .setText(R.strings.reviews)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }
}
