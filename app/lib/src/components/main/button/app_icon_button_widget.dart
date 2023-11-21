part of './app_button_base_builder.dart';

class AppIconButtonWidget extends AppButtonBaseBuilder {
  @override
  AppButtonBaseBuilder setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return this;
  }

  @override
  AppButtonBaseBuilder setPrefixIcon(Widget? prefixIcon) {
    _prefixIcon = prefixIcon;
    return this;
  }

  @override
  AppButtonBaseBuilder setBackgroundColor(Color? backgroundColor) {
    _backgroundColor = backgroundColor;
    return this;
  }

  @override
  AppButtonBaseBuilder setPadding(EdgeInsets? padding) {
    _padding = padding;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppThemeExt.of.majorScale(2),
        ),
        child: Container(
          padding: _padding,
          color: _backgroundColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _prefixIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
