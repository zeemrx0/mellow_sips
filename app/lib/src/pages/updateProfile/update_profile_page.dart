part of './update_profile_controller.dart';

class UpdateProfilePage extends GetView<UpdateProfileController> {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getProfile();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    final bottomPadding = MediaQuery.of(Get.context!).padding.bottom;

    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: AppThemeExt.of.majorScale(4),
                ),
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
                    .setValidator(controller.validatePhoneNumber)
                    .build(context),

                SizedBox(
                  height: AppThemeExt.of.majorScale(3),
                ),

                // Name field
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

                Padding(
                  padding: EdgeInsets.only(
                    top: AppThemeExt.of.majorScale(4),
                    bottom: bottomPadding + AppThemeExt.of.majorScale(3),
                  ),
                  child: AppFilledButtonWidget()
                      .setButtonText(R.strings.update)
                      .setOnPressed(() {
                    controller.updateProfile();
                  }).build(context),
                ),
              ],
            ),
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
              .setText(R.strings.updateProfile)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }
}
