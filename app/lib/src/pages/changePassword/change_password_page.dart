part of './change_password_controller.dart';

class ChangePasswordPage extends GetView<ChangePasswordController> {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormBuilder(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppThemeExt.of.majorScale(4),
                        ),
                        // Old Password field
                        AppTextHeading6Widget()
                            .setText(R.strings.oldPassword)
                            .build(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(2),
                        ),
                        Obx(
                          () => AppTextFieldWidget()
                              .setFieldKey(ChangePasswordKey.oldPassword)
                              .setHintText(R.strings.oldPassword)
                              .setObscureText(
                                  !controller.isOldPasswordShown.value)
                              .setMaxLine(1)
                              .setInputType(TextInputType.text)
                              .setSuffixIcon(
                                IconButton(
                                  onPressed: () {
                                    controller.toggleOldPasswordVisibility();
                                  },
                                  icon: controller.isOldPasswordShown.value
                                      ? R.svgs.icView.svg()
                                      : R.svgs.icNoView.svg(),
                                ),
                              )
                              .build(context),
                        ),

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
                        Obx(
                          () => AppTextFieldWidget()
                              .setFieldKey(ChangePasswordKey.newPassword)
                              .setHintText(R.strings.newPassword)
                              .setObscureText(
                                  !controller.isNewPasswordShown.value)
                              .setMaxLine(1)
                              .setInputType(TextInputType.text)
                              .setValidator(controller.validatePassword)
                              .setSuffixIcon(
                                IconButton(
                                  onPressed: () {
                                    controller.toggleNewPasswordVisibility();
                                  },
                                  icon: controller.isNewPasswordShown.value
                                      ? R.svgs.icView.svg()
                                      : R.svgs.icNoView.svg(),
                                ),
                              )
                              .build(context),
                        ),

                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),

                        // Confirm password field
                        AppTextHeading6Widget()
                            .setText(R.strings.confirmNewPassword)
                            .build(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(2),
                        ),
                        Obx(
                          () => AppTextFieldWidget()
                              .setFieldKey(ChangePasswordKey.confirmNewPassword)
                              .setHintText(R.strings.confirmNewPassword)
                              .setObscureText(
                                  !controller.isConfirmNewPasswordShown.value)
                              .setMaxLine(1)
                              .setInputType(TextInputType.text)
                              .setValidator(controller.validateConfirmPassword)
                              .setSuffixIcon(
                                IconButton(
                                  onPressed: () {
                                    controller
                                        .toggleConfirmNewPasswordVisibility();
                                  },
                                  icon:
                                      controller.isConfirmNewPasswordShown.value
                                          ? R.svgs.icView.svg()
                                          : R.svgs.icNoView.svg(),
                                ),
                              )
                              .build(context),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppThemeExt.of.majorScale(4),
                        bottom: AppThemeExt.of.majorScale(3),
                      ),
                      child: AppFilledButtonWidget()
                          .setButtonText(R.strings.changePassword)
                          .setOnPressed(() {
                        controller.changePassword();
                      }).build(context),
                    ),
                  ],
                ),
              ),
            ],
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
              .setText(R.strings.changePassword)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }
}
