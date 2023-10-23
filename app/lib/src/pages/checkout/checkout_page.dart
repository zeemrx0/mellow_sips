part of './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setTitle(
          AppTextBody1Widget()
              .setText('Đặt hàng')
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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextHeading6Widget()
                      .setText('Tạm tính (3 phần)')
                      .build(context),
                  AppTextBody1Widget()
                      .setText('21.000đ')
                      .setTextStyle(
                        AppTextStyleExt.of.textBody1r?.copyWith(
                          fontFamily: R.fontFamily.workSans,
                        ),
                      )
                      .build(context),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.of.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.of.grayColor[950]!.withOpacity(0.1),
                  blurRadius: AppThemeExt.of.majorScale(4),
                  offset: Offset(
                    0,
                    -1 * AppThemeExt.of.majorScale(1),
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
              ),
            ),
            padding: EdgeInsets.only(
              left: AppThemeExt.of.majorPaddingScale(4),
              right: AppThemeExt.of.majorPaddingScale(4),
              top: AppThemeExt.of.majorPaddingScale(4),
              bottom: AppThemeExt.of.majorPaddingScale(2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppFilledButtonWidget()
                      .setButtonText(R.strings.order)
                      .setOnPressed(
                        () {},
                      )
                      .build(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
