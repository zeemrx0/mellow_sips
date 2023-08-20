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
    final statusBarHeight = MediaQuery.of(Get.context!).padding.top;
    final topMarginHeight = statusBarHeight + AppThemeExt.of.majorScale(5);

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
              bottom: AppThemeExt.of.majorScale(4),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
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
                          key: controller.registerFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Phone number field
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

                                  // Name number field
                                  AppTextHeading6Widget()
                                      .setText(R.strings.yourName)
                                      .build(context),
                                  SizedBox(
                                    height: AppThemeExt.of.majorScale(2),
                                  ),
                                  AppTextFieldWidget()
                                      .setFieldKey(RegisterKey.displayName)
                                      .setHintText(R.strings.yourName)
                                      .setInputType(TextInputType.text)
                                      .build(context),

                                  SizedBox(
                                    height: AppThemeExt.of.majorScale(3),
                                  ),

                                  // Password field
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

                                  // Confirm password field
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
                                ],
                              ),

                              // Show continue button only if keyboard is not visible
                              KeyboardVisibilityBuilder(
                                builder: (p0, isKeyboardVisible) {
                                  if (!isKeyboardVisible) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        top: AppThemeExt.of.majorScale(4),
                                      ),
                                      child: AppFilledButtonWidget()
                                          .setButtonText(R.strings.register)
                                          .setOnPressed(() {
                                        // TODO: Register
                                      }).build(context),
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
                  ),
                ),
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
            InkWell(
              onTap: () {
                Get.back();
              },
              child: R.svgs.icClose.svg(
                width: AppThemeExt.of.majorScale(6),
                height: AppThemeExt.of.majorScale(6),
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        AppTextHeading3Widget().setText(R.strings.register).build(context),
      ],
    );
  }
}