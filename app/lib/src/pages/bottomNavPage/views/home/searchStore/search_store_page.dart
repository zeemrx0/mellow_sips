part of './search_store_controller.dart';

class SearchStorePage extends GetWidget<SearchStoreController> {
  const SearchStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _appBar(context),
        Obx(
          () => SliverToBoxAdapter(
            child: controller.keyword.value.isEmpty
                ? const SizedBox()
                : InkWell(
                    onTap: () {
                      int count = 0;
                      Get.offNamedUntil(
                        Routes.stores,
                        (route) {
                          count++;
                          return Get.arguments?[AppConstants.navigatedFrom] ==
                                  Routes.stores
                              ? count == 3
                              : count == 2;
                        },
                        arguments: {
                          AppConstants.keyword: controller.keyword.value,
                        },
                      );
                    },
                    child: Container(
                      color: AppColors.of.whiteColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorPaddingScale(4),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppThemeExt.of.majorPaddingScale(2),
                            vertical: AppThemeExt.of.majorPaddingScale(4),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.of.dividerColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              AppTextBody2Widget()
                                  .setText(
                                      '${R.strings.searchWithKeyword} ${controller.keyword.value}')
                                  .setColor(AppColors.of.primaryColor)
                                  .build(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: controller.data
                    .map(
                      (item) => InkWell(
                        onTap: () {
                          int count = 0;
                          Get.offNamedUntil(
                            Routes.stores,
                            (route) {
                              count++;
                              return Get.arguments?[
                                          AppConstants.navigatedFrom] ==
                                      Routes.stores
                                  ? count == 3
                                  : count == 2;
                            },
                            arguments: {
                              AppConstants.keyword: item.name,
                            },
                          );
                        },
                        child: Container(
                          color: AppColors.of.whiteColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppThemeExt.of.majorPaddingScale(4),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppThemeExt.of.majorPaddingScale(2),
                                vertical: AppThemeExt.of.majorPaddingScale(4),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.of.dividerColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  AppTextBody2Widget()
                                      .setText(item.name)
                                      .build(context),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: false,
      backgroundColor: AppColors.of.whiteColor,
      expandedHeight: max(
        kToolbarHeight,
        MediaQuery.of(Get.context!).padding.top +
            AppThemeExt.of.majorScale((42 + 8) / 4),
      ),
      collapsedHeight: max(
        kToolbarHeight,
        MediaQuery.of(Get.context!).padding.top +
            AppThemeExt.of.majorScale((42 + 8) / 4),
      ),
      leading: const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColors.of.whiteColor,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(Get.context!).padding.top +
                  AppThemeExt.of.majorScale(1),
              bottom: AppThemeExt.of.majorScale(1),
              left: AppThemeExt.of.majorScale(4),
              right: AppThemeExt.of.majorScale(4),
            ),
            child: Row(
              children: [
                AppIconButtonWidget()
                    .setPrefixIcon(
                  R.svgs.icLongArrowLeft.svg(
                    width: AppThemeExt.of.majorScale(4),
                    height: AppThemeExt.of.majorScale(4),
                  ),
                )
                    .setOnPressed(
                  () {
                    Get.back();
                  },
                ).build(context),
                SizedBox(
                  width: AppThemeExt.of.majorScale(4),
                ),
                Expanded(
                  child: AppTextFieldWidget()
                      .setFieldKey(SearchStoreKey.search)
                      .setPrefixIcon(
                        R.svgs.icSearch.svg(
                          width: AppThemeExt.of.majorScale(6),
                          height: AppThemeExt.of.majorScale(6),
                        ),
                      )
                      .setHasClearButton(false)
                      .setOnChanged((value) {
                        controller.keyword.value = value ?? '';

                        controller.onRefreshCall();
                      })
                      .setHintText(R.strings.search)
                      .build(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
