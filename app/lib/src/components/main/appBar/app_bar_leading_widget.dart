part of 'app_bar_base_builder.dart';

class AppBarLeadingWidget extends AppBarBaseBuilder {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: _leading ??
          AppButtonAppBarWidget()
              .setPrefixIcon(R.svgs.icArrowLineLeft.svg())
              .setOnPressed(() => Get.back())
              .build(context),
      title: AppTextHeading3Widget().setText(_headerPage).build(context),
      centerTitle: _centerTitle,
      actions: _actions,
      backgroundColor: _backgroundColor ?? AppColors.of.grayColor[100],
      bottom: _bottom,
    );
  }

  @override
  AppBarBaseBuilder setActions(List<Widget>? actions) {
    _actions = actions;
    return this;
  }

  @override
  AppBarBaseBuilder setBackgroundColor(Color? backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  @override
  AppBarBaseBuilder setBottom(PreferredSizeWidget? bottom) {
    _bottom = bottom;
    return this;
  }

  @override
  AppBarBaseBuilder setCenterTitle(bool? centerTitle) {
    _centerTitle = centerTitle ?? true;
    return this;
  }

  @override
  AppBarBaseBuilder setHeaderPage(String? headerPage) {
    _headerPage = headerPage;
    return this;
  }

  @override
  AppBarBaseBuilder setLeading(Widget? leading) {
    _leading = leading;
    return this;
  }
}
