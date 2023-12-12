part of './cart_list_controller.dart';

class CartListPage extends GetView<CartListController> {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAllCart();

    return AppMainPageWidget()
        .setAppBar(_appBar(context))
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: AppThemeExt.of.majorScale(3),
          ),
          child: Obx(
            () => Column(
              children: controller.carts.value
                      ?.map(
                        (cart) => InkWell(
                          onTap: () async {
                            await Get.toNamed(Routes.storeDetail, arguments: {
                              AppConstants.storeId: cart.store.id,
                            });
                            controller.getAllCart();
                          },
                          child: Container(
                            color: AppColors.of.whiteColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppThemeExt.of.majorPaddingScale(4),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    AppThemeExt.of.majorPaddingScale(10 / 4),
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
                                  DataImageWidget(
                                    imageData: cart.store.coverImageData,
                                    width: AppThemeExt.of.majorScale(20),
                                    height: AppThemeExt.of.majorScale(20),
                                    borderRadius: BorderRadius.circular(
                                      AppThemeExt.of.majorScale(2),
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppThemeExt.of.majorScale(2),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppTextBody2Widget()
                                            .setText(cart.store.name ?? '')
                                            .setTextStyle(
                                                AppTextStyleExt.of.textBody1s)
                                            .setColor(AppColors.of.primaryColor)
                                            .setMaxLines(1)
                                            .setTextOverFlow(
                                              TextOverflow.ellipsis,
                                            )
                                            .build(context),
                                        SizedBox(
                                          height: AppThemeExt.of.majorScale(1),
                                        ),
                                        AppTextCaption1Widget()
                                            .setText(
                                              cart.store.address ?? '',
                                            )
                                            .setColor(
                                              AppColors.of.subTextColor,
                                            )
                                            .build(context),
                                        SizedBox(
                                          height: AppThemeExt.of.majorScale(1),
                                        ),
                                        AppTextCaption1Widget()
                                            .setText(
                                              '${cart.numberOfItems.toString()} ${R.strings.items}',
                                            )
                                            .setTextStyle(
                                                AppTextStyleExt.of.textBody1s)
                                            .build(context),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBarBasicWidget()
        .setBackgroundColor(AppColors.of.whiteColor)
        .setTitle(
          AppTextBody1Widget()
              .setText(R.strings.cart)
              .setTextStyle(AppTextStyleExt.of.textBody1s)
              .setColor(AppColors.of.primaryColor)
              .build(context),
        )
        .setCanBack(true)
        .build(context);
  }
}
