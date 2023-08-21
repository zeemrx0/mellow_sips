import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

class AppBarBasicWidget {
  double? height;
  bool? canBack;
  Widget? title;
  Widget? leading;
  Widget? trailing;
  Widget? bottom;

  AppBarBasicWidget setHeight(double? height) {
    this.height = height;
    return this;
  }

  AppBarBasicWidget setCanBack(bool? canBack) {
    this.canBack = canBack;
    return this;
  }

  AppBarBasicWidget setTitle(Widget? title) {
    this.title = title;
    return this;
  }

  AppBarBasicWidget setLeading(Widget? leading) {
    this.leading = leading;
    return this;
  }

  AppBarBasicWidget setTrailing(Widget? trailing) {
    this.trailing = trailing;
    return this;
  }

  AppBarBasicWidget setBottom(Widget? bottom) {
    this.bottom = bottom;
    return this;
  }

  PreferredSize build(BuildContext context) {
    Widget leadingWidget = canBack == true
        ? InkWell(
            onTap: () {
              Get.back();
            },
            child: R.svgs.icLongArrowLeft.svg(),
          )
        : (leading ?? const SizedBox());

    return PreferredSize(
      preferredSize: Size.fromHeight(height ?? kToolbarHeight),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppThemeExt.of.majorScale(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: AppThemeExt.of.majorScale(1),
                ),
                height: kToolbarHeight,
                child: NavigationToolbar(
                  leading: leadingWidget,
                  middle: title ?? const SizedBox(),
                  trailing: trailing ?? const SizedBox(),
                  centerMiddle: true,
                ),
              ),
              if (bottom != null) bottom!,
            ],
          ),
        ),
      ),
    );
  }
}
