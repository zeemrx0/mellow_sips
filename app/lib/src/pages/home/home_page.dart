part of './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static void open() {
    Get.toNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    controller.subscribeNotifications();
    return AppMainPageWidget().setBody(_body(context)).build(context);
  }

  Widget _body(BuildContext context) {
    return ExtendedNestedScrollView(
      onlyOneScrollInBody: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: kToolbarHeight + AppThemeExt.of.majorScale(66 / 4),
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).padding.top +
                    AppThemeExt.of.majorScale(3),
                bottom: AppThemeExt.of.majorScale(3),
                left: AppThemeExt.of.majorScale(4),
                right: AppThemeExt.of.majorScale(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextFieldWidget()
                        .setFieldKey('search')
                        .build(context),
                  ),
                  InkWell(
                    onTap: () {
                      OrderListPage.open();
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppThemeExt.of.majorScale(2)),
                      child: R.svgs.icList.svg(
                        width: AppThemeExt.of.majorScale(6),
                        height: AppThemeExt.of.majorScale(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      body: Column(
        children: [
          AppFilledButtonWidget().setButtonText(R.strings.store).setOnPressed(
            () {
              StoreListPage.open();
            },
          ).build(context),
        ],
      ),
    );
  }
}
