part of './shop_list_controller.dart';

class ShopListPage extends GetView<ShopListController> {
  const ShopListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
          AppBarBasicWidget()
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
              .build(context),
        )
        .setBody(
          _body(context),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        // TODO: Tabs

        // List
        Expanded(
          child: AppListViewWidget<ShopModel, ShopListController>(
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
