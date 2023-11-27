part of './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller
        .getProductDetail(Get.arguments[ProductDetailKey.productId] as String);

    return AppMainPageWidget()
        .setBody(_body(context))
        .setBackgroundColor(AppColors.of.backgroundColor)
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => DataImageWidget(
            width: MediaQuery.of(Get.context!).size.width,
            height: MediaQuery.of(Get.context!).padding.top +
                AppThemeExt.of.majorScale(136 / 4),
            imageData: controller.product.value?.coverImageData,
          ),
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
                  () => FormBuilder(
                    key: controller.formKey.value,
                    initialValue: controller.formInitialValue.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _generalInfo(context),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),
                        ...(controller.product.value?.productOptionSections!
                                .map(
                              (section) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        AppTextHeading6Widget()
                                            .setText(section.name)
                                            .setTextAlign(TextAlign.left)
                                            .build(context),
                                        SizedBox(
                                          width: AppThemeExt.of.majorScale(2),
                                        ),
                                        _productOptionSectionHelpText(
                                          context,
                                          section,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppThemeExt.of.majorScale(2),
                                    ),
                                    if (section.productAddons != null &&
                                        section.maxAllowedChoices > 1)
                                      CheckboxButtonGroupWidget(
                                        fieldKey: section.id,
                                        addons: section.productAddons!,
                                        initialValue: controller
                                            .formInitialValue.value[section.id],
                                        maxAllowedChoices:
                                            section.maxAllowedChoices,
                                        onChanged: () {
                                          controller.formKey.value.currentState
                                              ?.save();
                                        },
                                      ),
                                    if (section.productAddons != null &&
                                        section.maxAllowedChoices <= 1)
                                      RadioButtonGroupWidget(
                                        fieldKey: section.id,
                                        addons: section.productAddons!,
                                        initialValue: controller
                                            .formInitialValue.value[section.id],
                                        onChanged: () {
                                          controller.formKey.value.currentState
                                              ?.save();
                                        },
                                      ),
                                  ],
                                );
                              },
                            ).toList() ??
                            []),
                        SizedBox(
                          height: AppThemeExt.of.majorScale(3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                    controller.decreaseProductQuantity();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      AppThemeExt.of.majorPaddingScale(2),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.of.grayColor[200],
                      borderRadius: BorderRadius.circular(
                        AppThemeExt.of.majorScale(6 / 4),
                      ),
                    ),
                    child: R.svgs.icMinus.svg(
                      width: AppThemeExt.of.majorScale(4),
                      height: AppThemeExt.of.majorScale(4),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(4),
                ),
                Obx(
                  () => AppTextBody1Widget()
                      .setText('${controller.quantity.value}')
                      .build(context),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(4),
                ),
                InkWell(
                  onTap: () {
                    controller.increaseProductQuantity();
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      AppThemeExt.of.majorPaddingScale(2),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.of.grayColor[200],
                      borderRadius: BorderRadius.circular(
                        AppThemeExt.of.majorScale(6 / 4),
                      ),
                    ),
                    child: R.svgs.icPlus.svg(
                      width: AppThemeExt.of.majorScale(4),
                      height: AppThemeExt.of.majorScale(4),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppThemeExt.of.majorScale(5),
                ),
                Expanded(
                  child: AppFilledButtonWidget()
                      .setButtonText(controller.isEditing()
                          ? R.strings.update
                          : R.strings.add)
                      .setOnPressed(
                    () {
                      if (controller.isEditing()) {
                        controller.updateCartItem();
                      } else {
                        controller.addToCart();
                      }
                    },
                  ).build(context),
                ),
              ],
            ),
          ),
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
        AppTextFieldWidget()
            .setFieldKey(ProductDetailKey.note)
            .setHintText(R.strings.note)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(6),
        ),
        AppTextHeading4Widget()
            .setText(controller.product.value?.name)
            .setTextAlign(TextAlign.left)
            .setColor(AppColors.of.primaryColor)
            .build(context),
        SizedBox(
          height: AppThemeExt.of.majorScale(1),
        ),
        SizedBox(
          height: AppThemeExt.of.majorScale(3),
        ),
      ],
    );
  }

  Widget _productOptionSectionHelpText(
      BuildContext context, ProductOptionSectionModel section) {
    if (section.isRequired && section.maxAllowedChoices > 1) {
      return AppTextBody2Widget()
          .setText('${R.strings.minimum} 1 ${R.strings.and} '
              '${R.strings.maximum} ${section.maxAllowedChoices}')
          .setColor(AppColors.of.subTextColor)
          .setTextAlign(TextAlign.left)
          .build(context);
    }
    if (section.isRequired) {
      return AppTextBody2Widget()
          .setText('${R.strings.minimum} 1')
          .setColor(AppColors.of.subTextColor)
          .setTextAlign(TextAlign.left)
          .build(context);
    }
    if (section.maxAllowedChoices > 1) {
      return AppTextBody2Widget()
          .setText('${R.strings.maximum} ${section.maxAllowedChoices}')
          .setColor(AppColors.of.subTextColor)
          .setTextAlign(TextAlign.left)
          .build(context);
    }
    return const SizedBox();
  }
}
