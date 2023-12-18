part of 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setBackgroundColor(AppColors.of.orangeColor[500])
        .setResizeToAvoidBottomInset(true)
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    final statusBarHeight = MediaQuery.of(Get.context!).padding.top;
    final topMarginHeight = statusBarHeight + AppThemeExt.of.majorScale(5);
    final bottomPadding = MediaQuery.of(Get.context!).padding.bottom;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: topMarginHeight,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: AppThemeExt.of.majorScale(4),
              right: AppThemeExt.of.majorScale(4),
              top: AppThemeExt.of.majorScale(5),
            ),
            decoration: BoxDecoration(
              color: AppColors.of.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(6),
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
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: FormBuilder(
                          key: controller.loginFormKey,
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
                                      .setFieldKey(LoginKey.phoneNumber)
                                      .setHintText(R.strings.phoneNumber)
                                      .setInputType(TextInputType.phone)
                                      .setValidator(
                                          controller.validatePhoneNumber)
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
                                  Obx(
                                    () => AppTextFieldWidget()
                                        .setFieldKey(LoginKey.password)
                                        .setHintText(R.strings.password)
                                        .setObscureText(
                                          !controller.isPasswordShown.value,
                                        )
                                        .setMaxLine(1)
                                        .setInputType(TextInputType.text)
                                        .setValidator(
                                          controller.validatePassword,
                                        )
                                        .setFocusNode(
                                          controller.passwordFocusNode,
                                        )
                                        .setSuffixIcon(
                                          IconButton(
                                            onPressed: () {
                                              controller
                                                  .togglePasswordVisibility();
                                            },
                                            icon:
                                                controller.isPasswordShown.value
                                                    ? R.svgs.icView.svg()
                                                    : R.svgs.icNoView.svg(),
                                          ),
                                        )
                                        .build(context),
                                  ),
                                  SizedBox(
                                    height: AppThemeExt.of.majorScale(3),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: AppThemeExt.of.majorScale(4),
                                  bottom: AppThemeExt.of.majorScale(3),
                                ),
                                child: AppFilledButtonWidget()
                                    .setButtonText(R.strings.logIn)
                                    .setOnPressed(() {
                                  controller.login();
                                }).build(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Show continue button only if keyboard is not visible
                KeyboardVisibilityBuilder(
                  builder: (p0, isKeyboardVisible) {
                    if (!isKeyboardVisible) {
                      return SizedBox(
                        height: bottomPadding,
                      );
                    }

                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            R.svgs.logo.svg(
              width: AppThemeExt.of.majorScale(12),
              height: AppThemeExt.of.majorScale(12),
            ),
            AppIconButtonWidget()
                .setPrefixIcon(
              R.svgs.icClose.svg(
                width: AppThemeExt.of.majorScale(6),
                height: AppThemeExt.of.majorScale(6),
              ),
            )
                .setOnPressed(
              () {
                Get.back();
              },
            ).build(context),
          ],
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        AppTextHeading3Widget().setText(R.strings.logIn).build(context),
      ],
    );
  }
}
