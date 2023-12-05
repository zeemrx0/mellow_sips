part of './store_list_controller.dart';

class StoreListPage extends GetView<StoreListController> {
  const StoreListPage({super.key});

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
          AppTextHeading6Widget().setText(R.strings.store).build(context),
        )
        .setTrailing(
          AppIconButtonWidget()
              .setPrefixIcon(
            R.svgs.icSearch.svg(
              width: AppThemeExt.of.majorScale(6),
              height: AppThemeExt.of.majorScale(6),
            ),
          )
              .setOnPressed(
            () {
              Get.toNamed(Routes.searchStore, arguments: {
                AppConstants.navigatedFrom: Routes.stores,
              });
            },
          ).build(context),
        )
        .setHeight(
          kToolbarHeight + AppThemeExt.of.majorScale(48 / 4),
        )
        .setCanBack(true)
        .setBottom(
          Padding(
            padding: EdgeInsets.only(
              bottom: AppThemeExt.of.majorPaddingScale(3),
            ),
            child: Obx(
              () => Row(
                children: [
                  ToggleChipWidget(
                    text: R.strings.open,
                    status: controller.isOpen.value,
                    onClick: () {
                      controller.isOpen.value = !controller.isOpen.value;
                      controller.onRefreshCall();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<StoreModel, StoreListController>(
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
