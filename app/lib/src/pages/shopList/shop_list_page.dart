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
                InkWell(
                  onTap: () {
                    // TODO: Show the filter page
                  },
                  child: Container(
                    decoration: _unselectedDecoration(),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorPaddingScale(3),
                      vertical: AppThemeExt.of.majorPaddingScale(6 / 4),
                    ),
                    child: Row(
                      children: [
                        AppTextCaption1Widget()
                            .setText(R.strings.sort)
                            .setColor(
                              AppColors.of.grayColor[600]!,
                            )
                            .setTextStyle(
                              AppTextStyleExt.of.textCaption1r,
                            )
                            .build(context),
                        SizedBox(
                          width: AppThemeExt.of.majorPaddingScale(1),
                        ),
                        R.svgs.icCaretDown.svg(
                          width: AppThemeExt.of.majorScale(4),
                          height: AppThemeExt.of.majorScale(4),
                          colorFilter: ColorFilter.mode(
                            AppColors.of.grayColor[500]!,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorPaddingScale(2),
                ),
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

  BoxDecoration _unselectedDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.of.grayColor[500]!,
      ),
      borderRadius: BorderRadius.circular(
        AppThemeExt.of.majorScale(1000),
      ),
    );
  }
}
