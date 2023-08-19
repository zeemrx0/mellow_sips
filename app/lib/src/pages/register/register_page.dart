part of 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setBackgroundColor(AppColors.of.orangeColor[500])
        .setResizeToAvoidBottomInset(true)
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    final deviceHeight = MediaQuery.of(Get.context!).size.height;
    final statusBarHeight = MediaQuery.of(Get.context!).padding.top;
    final topMarginHeight = statusBarHeight + AppThemeExt.of.majorScale(4);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: topMarginHeight,
          ),
          Container(
            height: deviceHeight - topMarginHeight,
            padding: EdgeInsets.only(
              left: AppThemeExt.of.majorScale(4),
              right: AppThemeExt.of.majorScale(4),
              top: AppThemeExt.of.majorScale(5),
              bottom: AppThemeExt.of.majorScale(4),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(12),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(12),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(context),
                SizedBox(
                  height: AppThemeExt.of.majorScale(5),
                ),
                Expanded(
                  child: FormBuilder(
                    key: controller.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextHeading6Widget()
                                .setText(R.strings.phoneNumber)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(2),
                            ),
                            AppTextFieldWidget()
                                .setFieldKey(RegisterKey.phoneNumber)
                                .setHintText(R.strings.phoneNumber)
                                .setInputType(TextInputType.phone)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(3),
                            ),
                            AppTextHeading6Widget()
                                .setText(R.strings.password)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(2),
                            ),
                            AppTextFieldWidget()
                                .setFieldKey(RegisterKey.password)
                                .setHintText(R.strings.password)
                                .setObscureText(true)
                                .setMaxLine(1)
                                .setInputType(TextInputType.text)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(3),
                            ),
                            AppTextHeading6Widget()
                                .setText(R.strings.confirmPassword)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(2),
                            ),
                            AppTextFieldWidget()
                                .setFieldKey(RegisterKey.confirmPassword)
                                .setHintText(R.strings.confirmPassword)
                                .setObscureText(true)
                                .setMaxLine(1)
                                .setInputType(TextInputType.text)
                                .build(context),
                            SizedBox(
                              height: AppThemeExt.of.majorScale(3),
                            ),
                            Row(
                              children: [
                                AppTextBody2Widget()
                                    .setText(R.strings.youAlreadyHaveAnAccount)
                                    .build(context),
                                SizedBox(
                                  width: AppThemeExt.of.majorScale(1),
                                ),
                                InkWell(
                                  child: AppTextBody2Widget()
                                      .setText(R.strings.login)
                                      .setColor(AppColors.of.primaryColor)
                                      .build(context),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: AppThemeExt.of.majorScale(4),
                          ),
                          child: AppFilledButtonWidget()
                              .setButtonText(R.strings.register)
                              .setOnPressed(() {
                            // TODO: Register
                          }).build(context),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppThemeExt.of.majorScale(6),
                ),
                AppTextBody1Widget()
                    .setTextStyle(
                      AppTextStyleExt.of.textBody1r
                          ?.copyWith(fontFamily: R.fontFamily.workSans),
                    )
                    .setTextAlign(TextAlign.center)
                    .setText(R.strings.or)
                    .build(context),
                SizedBox(
                  height: AppThemeExt.of.majorScale(3),
                ),
                AppFilledButtonWidget()
                    .setButtonText(R.strings.logInWithFacebook)
                    .setBackgroundColor(AppColors.of.blueColor[600])
                    .setPrefixIcon(
                      R.svgs.icFacebook.svg(
                        width: AppThemeExt.of.majorScale(6),
                        height: AppThemeExt.of.majorScale(6),
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                    .setOnPressed(
                  () {
                    // TODO: Login with Facebook
                  },
                ).build(context),
                SizedBox(
                  height: AppThemeExt.of.majorScale(4),
                ),
                AppOutlinedButtonWidget()
                    .setButtonText(R.strings.logInWithGoogle)
                    .setPrefixIcon(
                      R.svgs.icGoogle.svg(
                        width: AppThemeExt.of.majorScale(6),
                        height: AppThemeExt.of.majorScale(6),
                      ),
                    )
                    .setOnPressed(
                  () {
                    // TODO: Login with Google
                  },
                ).build(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        R.svgs.logo.svg(
          width: AppThemeExt.of.majorScale(12),
          height: AppThemeExt.of.majorScale(12),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        AppTextHeading5Widget().setText(R.strings.createAccount).build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(4),
        ),
        AppTextHeading3Widget()
            .setText(R.strings.welcomeTo)
            .setTextStyle(
              AppTextStyleExt.of.textHeading3b
                  ?.copyWith(fontFamily: R.fontFamily.comfortaa),
            )
            .build(context),
        AppTextHeading1Widget()
            .setText(R.strings.mellowSips)
            .setColor(AppColors.of.redColor[500])
            .build(context),
      ],
    );
  }
}
