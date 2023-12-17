part of './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getBestSellingProducts();
    controller.checkIsLoggedIn();

    final carouselItems = [
      CarouselItemWidget(
        image: R.pngs.carousel1.image(
          fit: BoxFit.cover,
        ),
      ),
      CarouselItemWidget(
        image: R.pngs.carousel2.image(
          fit: BoxFit.cover,
        ),
      ),
      CarouselItemWidget(
        image: R.pngs.carousel3.image(
          fit: BoxFit.cover,
        ),
      ),
      CarouselItemWidget(
        image: R.pngs.carousel4.image(
          fit: BoxFit.cover,
        ),
      ),
    ];

    return SafeArea(
      child: Column(
        children: [
          Container(
            color: AppColors.of.whiteColor,
            child: Padding(
              padding: EdgeInsets.only(
                top: AppThemeExt.of.majorScale(3),
                bottom: AppThemeExt.of.majorScale(3),
                left: AppThemeExt.of.majorScale(4),
                right: AppThemeExt.of.majorScale(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        await Get.toNamed(Routes.searchStore);
                        if (controller.isLoggedIn.value == true) {
                          controller.getAllCart();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppThemeExt.of.majorScale(10 / 4),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.of.borderColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppThemeExt.of.majorScale(10 / 4),
                          ),
                        ),
                        height: AppThemeExt.of.majorScale(44 / 4),
                        child: Row(children: [
                          R.svgs.icSearch.svg(
                            width: AppThemeExt.of.majorScale(6),
                            height: AppThemeExt.of.majorScale(6),
                          ),
                          SizedBox(
                            width: AppThemeExt.of.majorScale(2),
                          ),
                          Expanded(
                            child: AppTextBody1Widget()
                                .setText(R.strings.search)
                                .setColor(AppColors.of.subTextColor)
                                .setTextAlign(TextAlign.center)
                                .build(context),
                          ),
                          SizedBox(
                            width: AppThemeExt.of.majorScale(6),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    color: AppColors.of.backgroundColor,
                    child: Obx(
                      () => Column(
                        children: [
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(2),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: AppThemeExt.of.majorScale(4),
                                  offset: Offset(
                                    AppThemeExt.of.majorScale(0),
                                    AppThemeExt.of.majorScale(1),
                                  ),
                                ),
                              ],
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: SizedBox(
                                width: MediaQuery.of(Get.context!).size.width,
                                child: PageView(
                                  controller: controller.pageController,
                                  children: carouselItems,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(3),
                          ),
                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count: carouselItems.length,
                            effect: WormEffect(
                              dotHeight: AppThemeExt.of.majorScale(2),
                              dotWidth: AppThemeExt.of.majorScale(2),
                              dotColor: AppColors.of.disabledColor,
                              activeDotColor: AppColors.of.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(6),
                          ),
                          _categories(context),
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(6),
                          ),
                          if (controller.bestSellingProducts.value != null &&
                              controller.bestSellingProducts.value!.isNotEmpty)
                            _recommendedProductsSection(context),
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(6),
                          ),
                          if (controller.isLoggedIn.value &&
                              controller.orderedStores.value != null &&
                              controller.orderedStores.value!.isNotEmpty)
                            _orderedStoresSection(context),
                          SizedBox(
                            height: AppThemeExt.of.majorPaddingScale(12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => controller.carts.value == null ||
                          controller.carts.value!.isEmpty
                      ? const SizedBox()
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: AppThemeExt.of.majorScale(3),
                                  right: AppThemeExt.of.majorScale(3),
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: AppThemeExt.of.majorScale(4),
                                      offset: Offset(
                                        AppThemeExt.of.majorScale(0),
                                        AppThemeExt.of.majorScale(1),
                                      ),
                                    ),
                                  ],
                                ),
                                child: AppIconButtonWidget()
                                    .setBackgroundColor(AppColors.of.whiteColor)
                                    .setPadding(
                                      EdgeInsets.symmetric(
                                        horizontal:
                                            AppThemeExt.of.majorScale(14 / 4),
                                        vertical:
                                            AppThemeExt.of.majorScale(14 / 4),
                                      ),
                                    )
                                    .setPrefixIcon(
                                      R.svgs.icCartSolid.svg(
                                        width: AppThemeExt.of.majorScale(6),
                                        height: AppThemeExt.of.majorScale(6),
                                        colorFilter: ColorFilter.mode(
                                          AppColors.of.grayColor[900]!,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    )
                                    .setOnPressed(
                                  () async {
                                    await Get.toNamed(Routes.carts);

                                    if (controller.isLoggedIn.value == true) {
                                      controller.getAllCart();
                                    }
                                  },
                                ).build(context),
                              ),
                              Positioned(
                                top: -AppThemeExt.of.majorScale(1 / 2),
                                right: AppThemeExt.of.majorScale(2),
                                child: Container(
                                  width: AppThemeExt.of.majorScale(4),
                                  height: AppThemeExt.of.majorScale(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.of.primaryColor,
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AppTextCaption2Widget()
                                        .setText(
                                            '${controller.carts.value!.length}')
                                        .setTextStyle(
                                            AppTextStyleExt.of.textCaption2s)
                                        .setColor(AppColors.of.whiteColor)
                                        .build(context),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories(BuildContext context) {
    final deviceWidth = MediaQuery.of(Get.context!).size.width;
    final gapWidth = AppThemeExt.of.majorScale(1);
    final itemWidth = (deviceWidth - 32 - 32) / 3;
    final itemWidth2 = (deviceWidth - 32 - 16) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _categoryItem(
                context,
                itemWidth: itemWidth2,
                icon: R.svgs.icSalePanel.svg(
                  width: AppThemeExt.of.majorScale(44 / 4),
                  height: AppThemeExt.of.majorScale(44 / 4),
                ),
                title: R.strings.sale,
                onPressed: () async {
                  await Get.toNamed(Routes.promotingStores);
                  if (controller.isLoggedIn.value == true) {
                    controller.getAllCart();
                  }
                },
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              _categoryItem(
                context,
                itemWidth: itemWidth2,
                icon: R.pngs.icLike.image(
                  width: AppThemeExt.of.majorScale(48 / 4),
                  height: AppThemeExt.of.majorScale(48 / 4),
                ),
                title: R.strings.recommended,
                onPressed: () async {
                  await Get.toNamed(Routes.qualifiedStores);
                  if (controller.isLoggedIn.value == true) {
                    controller.getAllCart();
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: AppThemeExt.of.majorScale(3),
          ),
          Row(
            children: [
              _categoryItem(
                context,
                itemWidth: itemWidth,
                icon: R.pngs.icCoffee.image(
                  width: AppThemeExt.of.majorScale(48 / 4),
                  height: AppThemeExt.of.majorScale(48 / 4),
                ),
                title: R.strings.coffee,
                onPressed: () async {
                  await Get.toNamed(Routes.coffeeStores);
                  if (controller.isLoggedIn.value == true) {
                    controller.getAllCart();
                  }
                },
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              _categoryItem(
                context,
                itemWidth: itemWidth,
                icon: R.svgs.icMilkTea.svg(
                  width: AppThemeExt.of.majorScale(56 / 4),
                  height: AppThemeExt.of.majorScale(48 / 4),
                ),
                title: R.strings.milkTea,
                onPressed: () async {
                  await Get.toNamed(Routes.milkTeaStores);
                  if (controller.isLoggedIn.value == true) {
                    controller.getAllCart();
                  }
                },
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              _categoryItem(
                context,
                itemWidth: itemWidth,
                icon: R.pngs.icShop.image(
                  width: AppThemeExt.of.majorScale(44 / 4),
                  height: AppThemeExt.of.majorScale(44 / 4),
                ),
                title: R.strings.all,
                onPressed: () async {
                  await Get.toNamed(Routes.stores);
                  if (controller.isLoggedIn.value == true) {
                    controller.getAllCart();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(
    BuildContext context, {
    required double itemWidth,
    required Widget icon,
    required String title,
    Function()? onPressed,
  }) {
    return InkWell(
      onTap: () {
        onPressed?.call();
      },
      child: SizedBox(
        width: AppThemeExt.of.majorScale(itemWidth / 4),
        height: AppThemeExt.of.majorScale(78 / 4),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: AppThemeExt.of.majorScale(itemWidth / 4),
                height: AppThemeExt.of.majorScale(48 / 4),
                decoration: BoxDecoration(
                  color: AppColors.of.whiteColor,
                  borderRadius: BorderRadius.circular(
                    AppThemeExt.of.majorScale(1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: AppThemeExt.of.majorScale(4),
                      offset: Offset(
                        AppThemeExt.of.majorScale(0),
                        AppThemeExt.of.majorScale(1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(
                    bottom: AppThemeExt.of.majorScale(28 / 4),
                  ),
                  child: icon),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppThemeExt.of.majorScale(1),
                ),
                child: AppTextCaption1Widget()
                    .setText(title)
                    .setColor(AppColors.of.primaryColor)
                    .setTextStyle(AppTextStyleExt.of.textCaption1s)
                    .build(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendedProductsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTextBody2Widget()
                  .setText(R.strings.recommended)
                  .setTextStyle(AppTextStyleExt.of.textBody2s)
                  .setColor(AppColors.of.secondaryColor)
                  .build(context),
            ],
          ),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ),
        Obx(
          () => SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              right: AppThemeExt.of.majorScale(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: controller.bestSellingProducts.value == null
                  ? []
                  : controller.bestSellingProducts.value!.map((product) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: AppThemeExt.of.majorScale(4),
                        ),
                        child: ProductSectionItem(product: product),
                      );
                    }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _orderedStoresSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTextBody2Widget()
                  .setText(R.strings.reorderFamiliarStores)
                  .setTextStyle(AppTextStyleExt.of.textBody2s)
                  .setColor(AppColors.of.secondaryColor)
                  .build(context),
            ],
          ),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ),
        Obx(
          () => SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              right: AppThemeExt.of.majorScale(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: controller.orderedStores.value == null
                  ? []
                  : controller.orderedStores.value!.map((store) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: AppThemeExt.of.majorScale(4),
                        ),
                        child: StoreSectionItem(store: store),
                      );
                    }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
