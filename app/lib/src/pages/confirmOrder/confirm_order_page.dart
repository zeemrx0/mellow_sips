part of 'confirm_order_controller.dart';

class ConfirmOrderPage extends GetView<ConfirmOrderController> {
  const ConfirmOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget().setBody(_body(context)).build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        // QRView(
        //   key: controller.qrKey,
        //   onQRViewCreated: controller.onQRViewCreated,
        // ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(Get.context!).padding.top +
                    AppThemeExt.of.majorScale(4),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        AppThemeExt.of.majorPaddingScale(6 / 4),
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(106, 106, 105, 0.7),
                        borderRadius: BorderRadius.circular(
                          AppThemeExt.of.majorScale(2),
                        ),
                      ),
                      child: R.svgs.icArrowLongLeft.svg(
                        width: AppThemeExt.of.majorScale(5),
                        height: AppThemeExt.of.majorScale(5),
                        colorFilter: ColorFilter.mode(
                          AppColors.of.whiteColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(Get.context!).size.height * 0.1,
              ),
              AppTextBody2Widget()
                  .setText(R.strings.scanQRCodeOrEnterCodeToConfirm)
                  .setTextStyle(
                    AppTextStyleExt.of.textBody2s?.copyWith(
                      fontFamily: R.fontFamily.workSans,
                    ),
                  )
                  .build(context),
              SizedBox(
                height: AppThemeExt.of.majorScale(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.switchToScanCode();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorScale(3),
                          vertical: AppThemeExt.of.majorScale(6 / 4),
                        ),
                        decoration: controller.isScan.value
                            ? _selectedDecoration()
                            : _unselectedDecoration(),
                        child: AppTextCaption1Widget()
                            .setText(R.strings.scanCode)
                            .setColor(controller.isScan.value
                                ? AppColors.of.whiteColor
                                : AppColors.of.mainTextColor)
                            .setTextStyle(AppTextStyleExt.of.textCaption1s)
                            .build(context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppThemeExt.of.majorScale(2),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        controller.switchToEnterCode();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorScale(3),
                          vertical: AppThemeExt.of.majorScale(6 / 4),
                        ),
                        decoration: controller.isScan.value
                            ? _unselectedDecoration()
                            : _selectedDecoration(),
                        child: AppTextCaption1Widget()
                            .setText(R.strings.enterCode)
                            .setColor(controller.isScan.value
                                ? AppColors.of.mainTextColor
                                : AppColors.of.whiteColor)
                            .setTextStyle(AppTextStyleExt.of.textCaption1s)
                            .build(context),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppThemeExt.of.majorScale(4),
              ),
              Obx(
                () => controller.isScan.value
                    ? const SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 230,
                            child: AppTextFieldWidget()
                                .setFocusNode(controller.codeTextFieldFocusNode)
                                .setFieldKey(ConfirmOrderControllerKey.qrCode)
                                .setOnChanged((value) {
                                  controller.qrCode.value = value ?? '';
                                })
                                .setHintText(R.strings.enterCode)
                                .build(context),
                          ),
                          SizedBox(
                            width: AppThemeExt.of.majorScale(2),
                          ),
                          InkWell(
                            onTap: () {
                              controller.createOrder(
                                qrCode: controller.qrCode.value,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                AppThemeExt.of.majorScale(10 / 4),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.of.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  AppThemeExt.of.majorScale(10 / 4),
                                ),
                              ),
                              child: R.svgs.icChevronRight.svg(
                                width: AppThemeExt.of.majorScale(22 / 4),
                                height: AppThemeExt.of.majorScale(22 / 4),
                                colorFilter: ColorFilter.mode(
                                  AppColors.of.whiteColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Decoration _selectedDecoration() {
    return BoxDecoration(
      color: AppColors.of.primaryColor,
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(1000),
      ),
    );
  }

  Decoration _unselectedDecoration() {
    return BoxDecoration(
      color: AppColors.of.whiteColor,
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(1000),
      ),
      border: Border.all(
        color: AppColors.of.borderColor,
        width: 1,
      ),
    );
  }
}
