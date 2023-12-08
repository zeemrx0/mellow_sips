part of 'promoting_store_list_controller.dart';

class PromotingStoreListPage extends GetView<PromotingStoreListController> {
  const PromotingStoreListPage({super.key});

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
          AppTextHeading6Widget().setText(R.strings.sale).build(context),
        )
        .setCanBack(true)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<StoreModel, PromotingStoreListController>(
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
