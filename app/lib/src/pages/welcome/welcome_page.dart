part of './welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
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
              .setButtonText(R.strings.logIn)
              .setOnPressed(() {
            Get.toNamed(Routes.login);
          }).build(context),
          SizedBox(
            height: AppThemeExt.of.majorScale(3),
          ),
          AppOutlinedButtonWidget()
              .setButtonText(R.strings.register)
              .setOnPressed(() {
            RegisterPage.open();
          }).build(context),
        ],
      ),
    );
  }
}
