part of 'demo_controller.dart';

class DemoPage extends GetView<DemoController> {
  const DemoPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarWidget().setHeaderPage(R.strings.hello).build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    controller.saveLocalTest(message: DateTime.now().toString());
    controller.getLocalTest();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppThemeExt.of.majorPaddingScale(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppThemeExt.of.majorScale(2)),
        ],
      ),
    );
  }
}
