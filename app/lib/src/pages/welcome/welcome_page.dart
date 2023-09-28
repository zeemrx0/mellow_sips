part of './welcome_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget().setBody(_body(context)).build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppTextBody1Widget()
              .setText(R.strings.welcomeTo)
              .setTextAlign(TextAlign.center)
              .build(context),
          AppTextHeading1Widget()
              .setText(R.strings.mellowSips)
              .setTextAlign(TextAlign.center)
              .setColor(AppColors.of.primaryColor[500])
              .build(context),
          Flexible(
            child: R.pngs.welcome.image(),
          ),
          SizedBox(
            height: AppThemeExt.of.majorScale(8),
          ),
          AppFilledButtonWidget()
              .setButtonText(R.strings.login)
              .setOnPressed(() {
            LoginPage.open();
          }).build(context),
          SizedBox(
            height: AppThemeExt.of.majorScale(4),
          ),
          AppOutlinedButtonWidget()
              .setButtonText(R.strings.register)
              .setOnPressed(() {
            RegisterPage.open();
          }).build(context),
          SizedBox(
            height: AppThemeExt.of.majorScale(5),
          ),
          AppTextBody1Widget()
              .setText(R.strings.or)
              .setTextAlign(TextAlign.center)
              .build(context),
          SizedBox(
            height: AppThemeExt.of.majorScale(3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // TODO: Login with facebook
                },
                child: Container(
                  padding: EdgeInsets.all(
                    AppThemeExt.of.majorScale(10 / 4),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.of.blueColor[500],
                  ),
                  child: R.svgs.icFacebook.svg(
                    width: AppThemeExt.of.majorScale(6),
                    height: AppThemeExt.of.majorScale(6),
                    colorFilter: ColorFilter.mode(
                      AppColors.of.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(3),
              ),
              InkWell(
                onTap: () {
                  // TODO: Login with google
                },
                child: Container(
                  padding: EdgeInsets.all(
                    AppThemeExt.of.majorScale(10 / 4),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.of.grayColor[400]!,
                      width: 1,
                    ),
                    color: AppColors.of.whiteColor,
                  ),
                  child: R.svgs.icGoogle.svg(
                    width: AppThemeExt.of.majorScale(6),
                    height: AppThemeExt.of.majorScale(6),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
