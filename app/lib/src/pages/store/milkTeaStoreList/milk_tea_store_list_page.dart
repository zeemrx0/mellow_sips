part of 'milk_tea_store_list_controller.dart';

class MilkTeaStoreListPage extends GetView<MilkTeaStoreListController> {
  const MilkTeaStoreListPage({super.key});

  static void open() {
    Get.toNamed(Routes.stores);
  }

  @override
  Widget build(BuildContext context) {
    controller.keyword.value = Get.arguments?[AppConstants.keyword] ?? '';
    if (controller.keyword.value.isNotEmpty) {
      controller.onRefreshCall();
    }

    return AppMainPageWidget()
        .setAppBar(
          _appBar(context),
        )
        .setBackgroundColor(
          AppColors.of.backgroundColor,
        )
        .setBody(
          _body(context),
        )
        .build(context);
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setTitle(
          AppTextHeading6Widget().setText(R.strings.milkTea).build(context),
        )
        .setCanBack(true)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<StoreModel, MilkTeaStoreListController>(
            padding: EdgeInsets.only(
              top: AppThemeExt.of.majorPaddingScale(2),
            ),
            childBuilder: _storeItemBuilder,
          ),
        ),
      ],
    );
  }

  Widget _storeItemBuilder(
    BuildContext context,
    StoreModel storeModel,
    int index,
  ) {
    return StoreItemWidget(
      store: storeModel,
    );
  }
}
