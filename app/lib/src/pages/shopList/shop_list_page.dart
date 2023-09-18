part of './shop_list_controller.dart';

class ShopListPage extends GetView<ShopListController> {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          AppTextHeading6Widget().setText(R.strings.shop).build(context),
        )
        .setTrailing(
          InkWell(
            child: R.svgs.icSearch.svg(
              width: AppThemeExt.of.majorScale(6),
              height: AppThemeExt.of.majorScale(6),
            ),
          ),
        )
        .setHeight(
          kToolbarHeight + AppThemeExt.of.majorScale(48 / 4),
        )
        .setBottom(
          Padding(
            padding: EdgeInsets.only(
              bottom: AppThemeExt.of.majorPaddingScale(3),
            ),
            child: Row(
              children: [
                ToggleChipWidget()
                    .setFieldKey(ShopListKey.hasPromo)
                    .setText(R.strings.promo)
                    .setOnClick(
                  () {
                    // TODO: Load the list of shops with promo
                  },
                ).build(context),
                SizedBox(
                  width: AppThemeExt.of.majorPaddingScale(2),
                ),
                ToggleChipWidget()
                    .setFieldKey(ShopListKey.isOpen)
                    .setText(R.strings.open)
                    .setOnClick(
                  () {
                    // TODO: Load the list of shops that are open
                  },
                ).build(context),
              ],
            ),
          ),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AppListViewWidget<ShopModel, ShopListController>(
            padding: EdgeInsets.only(
              top: AppThemeExt.of.majorPaddingScale(2),
            ),
            childBuilder: _shopItemBuilder,
          ),
        ),
      ],
    );
  }

  Widget _shopItemBuilder(
    BuildContext context,
    ShopModel shopModel,
    int index,
  ) {
    return ShopItemWidget(
      shop: shopModel,
    );
  }
}
