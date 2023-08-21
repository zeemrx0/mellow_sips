part of 'app_text_base_builder.dart';

class AppTextHeading6Widget extends AppTextBaseBuilder {
  @override
  Widget build(BuildContext context) {
    final orgTextStyle = context.textTheme.headlineSmall;
    if (_textStyle == null) {
      setTextStyle(orgTextStyle);
    } else {
      setTextStyle(
        _textStyle?.copyWith(fontSize: orgTextStyle?.fontSize),
      );
    }
    return super.build(context);
  }

  @override
  AppTextHeading6Widget setMaxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  @override
  AppTextHeading6Widget setText(String? text) {
    _text = text;
    return this;
  }

  @override
  AppTextHeading6Widget setTextAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  @override
  AppTextHeading6Widget setTextOverFlow(TextOverflow? textOverflow) {
    _textOverflow = textOverflow;
    return this;
  }

  @override
  AppTextHeading6Widget setTextStyle(TextStyle? textStyle) {
    _textStyle = textStyle;
    return this;
  }

  @override
  AppTextHeading6Widget setColor(Color? color) {
    _color = color;
    return this;
  }
}
