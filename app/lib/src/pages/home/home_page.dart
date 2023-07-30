part of 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
    print(BuildConfig.apiDomain);
    controller.getTest();
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
