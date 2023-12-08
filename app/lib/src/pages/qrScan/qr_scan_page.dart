part of 'qr_scan_controller.dart';

class QrScanPage extends GetView<QrScanController> {
  const QrScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget().setBody(_body(context)).build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: controller.qrKey,
          onQRViewCreated: controller.onQRViewCreated,
        ),
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
                  .setText(R.strings.scanQRCodeToViewMenu)
                  .setTextStyle(AppTextStyleExt.of.textBody2s)
                  .build(context),
              SizedBox(
                height: AppThemeExt.of.majorScale(4),
              ),
              R.pngs.qrFrame.image(),
            ],
          ),
        ),
      ],
    );
  }
}
