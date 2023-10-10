import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

class AppBarBasicWidget {
  double? _height;
  bool? _canBack;
  Widget? _title;
  Widget? _leading;
  Widget? _trailing;
  Widget? _bottom;
  Color? _backgroundColor;

  AppBarBasicWidget setHeight(double? height) {
    _height = height;
    return this;
  }

  AppBarBasicWidget setCanBack(bool? canBack) {
    _canBack = canBack;
    return this;
  }

  AppBarBasicWidget setTitle(Widget? title) {
    _title = title;
    return this;
  }

  AppBarBasicWidget setLeading(Widget? leading) {
    _leading = leading;
    return this;
  }

  AppBarBasicWidget setTrailing(Widget? trailing) {
    _trailing = trailing;
    return this;
  }

  AppBarBasicWidget setBottom(Widget? bottom) {
    _bottom = bottom;
    return this;
  }

  AppBarBasicWidget setBackgroundColor(Color? backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  PreferredSize build(BuildContext context) {
    Widget leadingWidget = _canBack == true
        ? InkWell(
            onTap: () {
              Get.back();
            },
            child: R.svgs.icLongArrowLeft.svg(),
          )
        : (_leading ?? const SizedBox());

    return PreferredSize(
      preferredSize: Size.fromHeight(_height ?? kToolbarHeight),
      child: SafeArea(
        child: Container(
          color: _backgroundColor,
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
                  middle: _title ?? const SizedBox(),
                  trailing: _trailing ?? const SizedBox(),
                  centerMiddle: true,
                ),
              ),
              if (_bottom != null) _bottom!,
            ],
          ),
        ),
      ),
    );
  }
}
