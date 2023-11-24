part of './store_detail_controller.dart';

class StoreDetailPage extends GetWidget<StoreDetailController> {
  const StoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getStoreDetail();
    controller.getStoreMenu();
    controller.getNumberOfCartItems();

    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => Container(
            width: MediaQuery.of(Get.context!).size.width,
            height: MediaQuery.of(Get.context!).padding.top +
                AppThemeExt.of.majorScale(136 / 4),
            color: AppColors.of.grayColor[300],
            child: DataImageWidget(
              imageData: controller.store.value?.coverImageData,
            ),
          ),
        ),
        Expanded(
          child: ExtendedNestedScrollView(
            onlyOneScrollInBody: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              _sliverAppBar(context),
            ],
            body: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.of.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppThemeExt.of.majorScale(6),
                    ),
                    topRight: Radius.circular(
                      AppThemeExt.of.majorScale(6),
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppThemeExt.of.majorPaddingScale(4),
                  vertical: AppThemeExt.of.majorPaddingScale(5),
                ),
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _generalInfo(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),
                        Container(
                          color: AppColors.of.dividerColor,
                          height: 1,
                        ),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),
                        if (controller.menu.value != null)
                          ...controller.menu.value!.menuSections.map((section) {
                            return _foodList(context, section);
                          }).toList(),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(60 / 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.of.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.of.grayColor[950]!.withOpacity(0.1),
                  blurRadius: AppThemeExt.of.majorScale(4),
                  offset: Offset(
                    0,
                    -1 * AppThemeExt.of.majorScale(1),
                  ),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
                topRight: Radius.circular(
                  AppThemeExt.of.majorScale(6),
                ),
              ),
            ),
            padding: EdgeInsets.only(
              left: AppThemeExt.of.majorPaddingScale(4),
              right: AppThemeExt.of.majorPaddingScale(4),
              top: AppThemeExt.of.majorPaddingScale(4),
              bottom: AppThemeExt.of.majorPaddingScale(2),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.carts);
                  },
                  child: Container(
                    height: AppThemeExt.of.majorScale(42 / 4),
                    width: AppThemeExt.of.majorScale(86 / 4),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppThemeExt.of.majorPaddingScale(4),
                      vertical: AppThemeExt.of.majorPaddingScale(10 / 4),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.of.whiteColor,
                      borderRadius: BorderRadius.circular(
                        AppThemeExt.of.majorScale(10 / 4),
                      ),
                      border: Border.all(
                        color: AppColors.of.borderColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        R.svgs.icCartOutline.svg(
                          width: AppThemeExt.of.majorScale(5),
                          height: AppThemeExt.of.majorScale(5),
                        ),
                        SizedBox(
                          width: AppThemeExt.of.majorScale(2),
                        ),
                        Obx(
                          () => AppTextBody1Widget()
                              .setText('${controller.numberOfCartItems.value}')
                              .setTextStyle(AppTextStyleExt.of.textBody1s)
                              .build(context),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(5),
                ),
                Obx(
                  () => Expanded(
                    child: AppFilledButtonWidget()
                        .setButtonText(R.strings.checkout)
                        .setIsDisabled(controller.numberOfCartItems.value == 0)
                        .setOnPressed(
                      () {
                        Get.toNamed(
                          Routes.checkout,
                          arguments: controller.cartId.value,
                        );
                      },
                    ).build(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SliverAppBar _sliverAppBar(BuildContext context) {
    final appBarHeight = AppThemeExt.of.majorScale(112 / 4);
    // final scrollOffset = min(offset, appBarHeight);

    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      expandedHeight: appBarHeight,
      pinned: true,
      // backgroundColor:
      //     Color.fromRGBO(255, 255, 255, scrollOffset / appBarHeight),
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: EdgeInsets.only(
          left: AppThemeExt.of.majorPaddingScale(4),
        ),
        child: Row(
          children: [
            AppIconButtonWidget()
                .setPrefixIcon(
                  R.svgs.icArrowLongLeft.svg(
                    width: AppThemeExt.of.majorScale(5),
                    height: AppThemeExt.of.majorScale(5),
                    colorFilter: ColorFilter.mode(
                      AppColors.of.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                )
                .setPadding(
                  EdgeInsets.all(
                    AppThemeExt.of.majorPaddingScale(6 / 4),
                  ),
                )
                .setBackgroundColor(const Color.fromRGBO(106, 106, 105, 0.7))
                .setOnPressed(
              () {
                Get.back();
              },
            ).build(context),
          ],
        ),
      ),
      actions: [
        AppIconButtonWidget()
            .setPrefixIcon(
              R.svgs.icHeartOutline.svg(
                width: AppThemeExt.of.majorScale(5),
                height: AppThemeExt.of.majorScale(5),
                colorFilter: ColorFilter.mode(
                  AppColors.of.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            )
            .setPadding(
              EdgeInsets.all(
                AppThemeExt.of.majorPaddingScale(6 / 4),
              ),
            )
            .setBackgroundColor(const Color.fromRGBO(106, 106, 105, 0.7))
            .setOnPressed(
          () {
            // TODO: Like
          },
        ).build(context),
        SizedBox(
          width: AppThemeExt.of.majorScale(4),
        )
      ],
    );
  }

  Widget _generalInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextHeading4Widget()
            .setText(controller.store.value?.name)
            .setTextAlign(TextAlign.left)
            .setColor(AppColors.of.primaryColor)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        AppTextCaption1Widget()
            .setText(controller.store.value?.address)
            .setColor(AppColors.of.subTextColor)
            .setMaxLines(2)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ),
        Row(
          children: [
            R.svgs.icStarYellow.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(2),
            ),
            AppTextCaption1Widget()
                .setText(controller.store.value?.rating != null
                    ? '${controller.store.value?.rating}'
                    : null)
                .build(context),
          ],
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(2),
        ),
        Row(
          children: [
            R.svgs.icTag.svg(
              width: AppThemeExt.of.majorScale(4),
              height: AppThemeExt.of.majorScale(4),
              colorFilter: ColorFilter.mode(
                AppColors.of.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              width: AppThemeExt.of.majorScale(2),
            ),
            AppTextCaption1Widget().setText('Ưu đãi đến 45k').build(context),
          ],
        ),
      ],
    );
  }

  Widget _foodList(BuildContext context, MenuSectionModel section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextHeading6Widget()
            .setText(section.name)
            .setTextAlign(TextAlign.left)
            .setColor(AppColors.of.primaryColor)
            .build(context),
        ...section.products.map((product) {
          return FoodItemWidget(
            id: product.id ?? '',
            imageData: product.coverImageData,
            name: product.name ?? '',
            description: product.description ?? '',
            price: product.price ?? 0,
            onPressed: () async {
              final result = await Get.toNamed(
                Routes.productDetail,
                arguments: product.id,
              );
              if (result == true) {
                controller.getNumberOfCartItems();
              }
            },
          );
        }).toList(),
        SizedBox(
          height: AppThemeExt.of.majorScale(6),
        ),
      ],
    );
  }
}
