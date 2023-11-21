part of './verify_registration_controller.dart';

class VerifyRegistrationPage extends GetWidget<VerifyRegistrationController> {
  const VerifyRegistrationPage({super.key});

  static void open({required String phoneNumber}) {
    Get.toNamed(Routes.verifyRegistration, arguments: {
      VerifyRegistrationKey.phoneNumber: phoneNumber,
    });
  }

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
                          key: controller.verifyRegistrationFormKey,
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
                                      .setText(
                                          R.strings.enterOtpToVerifyAccount)
                                      .build(context),
                                  SizedBox(
                                    height: AppThemeExt.of.majorScale(2),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit1)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[1],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[2]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                      SizedBox(
                                        width: AppThemeExt.of.majorScale(3),
                                      ),
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit2)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[2],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[3]
                                                    ?.requestFocus();
                                              } else {
                                                controller.otpDigitFocusNodes[1]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                      SizedBox(
                                        width: AppThemeExt.of.majorScale(3),
                                      ),
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit3)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[3],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[4]
                                                    ?.requestFocus();
                                              } else {
                                                controller.otpDigitFocusNodes[2]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                      SizedBox(
                                        width: AppThemeExt.of.majorScale(3),
                                      ),
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit4)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[4],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[5]
                                                    ?.requestFocus();
                                              } else {
                                                controller.otpDigitFocusNodes[3]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                      SizedBox(
                                        width: AppThemeExt.of.majorScale(3),
                                      ),
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit5)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[5],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[6]
                                                    ?.requestFocus();
                                              } else {
                                                controller.otpDigitFocusNodes[4]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                      SizedBox(
                                        width: AppThemeExt.of.majorScale(3),
                                      ),
                                      SizedBox(
                                        width:
                                            AppThemeExt.of.majorScale(42 / 4),
                                        child: AppTextFieldWidget()
                                            .setFieldKey(
                                                VerifyRegistrationKey.otpDigit6)
                                            .setFocusNode(
                                              controller.otpDigitFocusNodes[6],
                                            )
                                            .setOnChanged((value) {
                                              if (value != null &&
                                                  value.isNotEmpty) {
                                                controller.otpDigitFocusNodes[6]
                                                    ?.unfocus();

                                                controller
                                                    .submitVerificationRegistrationForm();
                                              } else {
                                                controller.otpDigitFocusNodes[5]
                                                    ?.requestFocus();
                                              }
                                            })
                                            .setInputType(TextInputType.number)
                                            .setHasClearButton(false)
                                            .build(context),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: AppThemeExt.of.majorScale(5),
                                  ),

                                  InkWell(
                                    onTap: () {
                                      controller.resendOtp();
                                    },
                                    child: AppTextBody1Widget()
                                        .setText(
                                          R.strings.resendOtp,
                                        )
                                        .setTextStyle(
                                            AppTextStyleExt.of.textBody1s)
                                        .build(context),
                                  )
                                ],
                              ),
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
        AppTextHeading3Widget().setText(R.strings.verifyAccount).build(context),
      ],
    );
  }
}
