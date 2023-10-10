part of './store_detail_controller.dart';

class StoreDetailPage extends GetView<StoreDetailController> {
  const StoreDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getStoreMenu();

    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          width: MediaQuery.of(Get.context!).size.width,
          height: MediaQuery.of(Get.context!).padding.top +
              AppThemeExt.of.majorScale(136 / 4),
          imageUrl:
              'https://phuclong.com.vn/uploads/store/83943c23fd8b7a-ntmk.jpg',
          fit: BoxFit.cover,
        ),
        CustomScrollView(
          slivers: [
            SliverLayoutBuilder(
              builder: (context, constraints) {
                return _sliverAppBar(context, constraints);
              },
            ),
            SliverFillRemaining(
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  SliverAppBar _sliverAppBar(
    BuildContext context,
    SliverConstraints constraints,
  ) {
    final appBarHeight = AppThemeExt.of.majorScale(112 / 4);
    final scrollOffset = min(constraints.scrollOffset, appBarHeight);

    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      expandedHeight: appBarHeight,
      pinned: true,
      backgroundColor:
          Color.fromRGBO(255, 255, 255, scrollOffset / appBarHeight),
      leading: Container(
        margin: EdgeInsets.only(
          left: AppThemeExt.of.majorPaddingScale(4),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(
                  AppThemeExt.of.majorPaddingScale(6 / 4),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(106, 106, 105, 0.7),
                  borderRadius: BorderRadius.circular(
                    AppThemeExt.of.majorScale(2),
                  ),
                ),
                child: R.svgs.icArrowLongLeft.svg(
                  width: AppThemeExt.of.majorScale(5),
                  height: AppThemeExt.of.majorScale(5),
                  colorFilter: ColorFilter.mode(
                    AppColors.of.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            // TODO: Like
          },
          child: Container(
            padding: EdgeInsets.all(
              AppThemeExt.of.majorPaddingScale(6 / 4),
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(106, 106, 105, 0.7),
              borderRadius: BorderRadius.circular(
                AppThemeExt.of.majorScale(2),
              ),
            ),
            child: R.svgs.icHeartOutline.svg(
              width: AppThemeExt.of.majorScale(5),
              height: AppThemeExt.of.majorScale(5),
              colorFilter: ColorFilter.mode(
                AppColors.of.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
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
            .setText('Phúc Long, Phan Xích Long')
            .setTextAlign(TextAlign.left)
            .setColor(AppColors.of.primaryColor)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        AppTextCaption1Widget()
            .setText(
                '95 Phan Xích Long, Phường 7, Phú Nhuận, Thành phố Hồ Chí Minh')
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
            AppTextCaption1Widget().setText('4.5 (1k+)').build(context),
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
            image: product.coverImage ?? '',
            name: product.name ?? '',
            description: product.description ?? '',
            price: product.price ?? 0,
          );
        }).toList(),
      ],
    );
  }
}
