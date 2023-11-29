part of './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  static void open() {
    Get.toNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    controller.subscribeNotifications();
    controller.getProducts();

    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .setBottomNavigationBar(
            const AppBottomNavigationBarWidget().build(context))
        .setFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerDocked,
        )
        .setFloatingActionButton(
          const FloatingAppButton(),
        )
        .build(context);
  }

  Widget _body(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    final carouselItems = [
      const CarouselItemWidget(
          imageData:
              'https://phuclong.com.vn/uploads/post/7d8a71540edb53-dr_combongaytrannangluong40k_51022_640512thumbnail.png'),
      const CarouselItemWidget(
          imageData:
              'https://phuclong.com.vn/uploads/post/7d8a71540edb53-dr_combongaytrannangluong40k_51022_640512thumbnail.png'),
    ];

    return ExtendedNestedScrollView(
      controller: scrollController,
      onlyOneScrollInBody: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          backgroundColor: AppColors.of.whiteColor,
          expandedHeight: max(
            kToolbarHeight,
            MediaQuery.of(Get.context!).padding.top +
                AppThemeExt.of.majorScale(36 / 4),
          ),
          collapsedHeight: max(
            kToolbarHeight,
            MediaQuery.of(Get.context!).padding.top +
                AppThemeExt.of.majorScale(36 / 4),
          ),
          leading: const SizedBox(),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: AppColors.of.whiteColor,
              child: Padding(
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
                          .setPrefixIcon(
                            R.svgs.icSearch.svg(
                              width: AppThemeExt.of.majorScale(6),
                              height: AppThemeExt.of.majorScale(6),
                            ),
                          )
                          .setHintText(R.strings.search)
                          .build(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.of.backgroundColor,
          child: Column(
            children: [
              SizedBox(
                height: AppThemeExt.of.majorPaddingScale(2),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: SizedBox(
                  width: MediaQuery.of(Get.context!).size.width,
                  child: PageView(
                    controller: controller.pageController,
                    children: carouselItems,
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
              _section(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _categories(BuildContext context) {
    final deviceWidth = MediaQuery.of(Get.context!).size.width;
    final gapWidth = AppThemeExt.of.majorScale(1);
    final itemWidth = (deviceWidth - 32 - 32) / 3;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
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
                          child: R.svgs.icNearby.svg(
                            width: AppThemeExt.of.majorScale(40 / 4),
                            height: AppThemeExt.of.majorScale(44 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.nearby)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              InkWell(
                onTap: () {},
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
                          child: R.svgs.icSalePanel.svg(
                            width: AppThemeExt.of.majorScale(44 / 4),
                            height: AppThemeExt.of.majorScale(44 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.sale)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              InkWell(
                onTap: () {},
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
                          child: R.pngs.icLike.image(
                            width: AppThemeExt.of.majorScale(48 / 4),
                            height: AppThemeExt.of.majorScale(48 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.recommended)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppThemeExt.of.majorScale(4),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.stores);
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
                          child: R.pngs.icCoffee.image(
                            width: AppThemeExt.of.majorScale(48 / 4),
                            height: AppThemeExt.of.majorScale(48 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.coffee)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              InkWell(
                onTap: () {},
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
                          child: R.svgs.icMilkTea.svg(
                            width: AppThemeExt.of.majorScale(56 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.milkTea)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: AppThemeExt.of.majorScale(gapWidth),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.stores);
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
                          child: R.pngs.icShop.image(
                            width: AppThemeExt.of.majorScale(44 / 4),
                            height: AppThemeExt.of.majorScale(44 / 4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: AppThemeExt.of.majorScale(1),
                          ),
                          child: AppTextCaption1Widget()
                              .setText(R.strings.all)
                              .setColor(AppColors.of.primaryColor)
                              .setTextStyle(AppTextStyleExt.of.textCaption1s)
                              .build(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _section(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextBody2Widget()
                  .setText(R.strings.recommended)
                  .setTextStyle(AppTextStyleExt.of.textBody2s)
                  .setColor(AppColors.of.secondaryColor)
                  .build(context),
              SizedBox(
                width: AppThemeExt.of.majorScale(1),
              ),
              AppTextBody2Widget()
                  .setText(R.strings.showMore)
                  .setColor(AppColors.of.subTextColor)
                  .build(context),
            ],
          ),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(2),
        ),
        Obx(
          () => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: controller.products.value == null
                  ? []
                  : controller.products.value!.map((product) {
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
}
