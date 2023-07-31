// ignore_for_file: constant_identifier_names

part of 'app_theme.dart';

class _AppTextSize {
  static const double T34 = 34;
  static const double T30 = 30;
  static const double T24 = 24;
  static const double T20 = 20;
  static const double T16 = 16;
  static const double T14 = 14;
  static const double T12 = 12;
}

class _AppTextHeight {
  static const double H34_44 = 44 / 34;
  static const double H30_40 = 40 / 30;
  static const double H24_32 = 32 / 24;
  static const double H20_28 = 28 / 20;
  static const double H16_24 = 24 / 16;
  static const double H14_22 = 22 / 14;
  static const double H12_18 = 18 / 12;
}

abstract class _AppTextStyle {
  static FontWeight get bold => FontWeight.w700;

  static FontWeight get semiBold => FontWeight.w600;

  static FontWeight get regular => FontWeight.w400;

  static FontWeight get medium => FontWeight.w500;

  static TextTheme textTheme(AppColors appColor) {
    return TextTheme(
      // Heading 1
      displayLarge: _textHeading1s.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 2
      displayMedium: _textHeading2s.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 3
      displaySmall: _textHeading3s.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 4
      headlineLarge: _textHeading4m.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 5
      headlineMedium: _textHeading5m.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 6
      headlineSmall: _textHeading6m.copyWith(
        color: appColor.grayColor,
      ),

      /// Body
      bodyLarge: _textBody1r.copyWith(
        color: appColor.grayColor,
      ),
    );
  }

  static final TextStyle _textHeading1s = TextStyle(
    height: _AppTextHeight.H34_44,
    fontSize: _AppTextSize.T34,
    fontWeight: bold,
  );

  static final TextStyle _textHeading2s = TextStyle(
    height: _AppTextHeight.H30_40,
    fontSize: _AppTextSize.T30,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading3s = TextStyle(
    height: _AppTextHeight.H24_32,
    fontSize: _AppTextSize.T24,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading4m = TextStyle(
    height: _AppTextHeight.H20_28,
    fontSize: _AppTextSize.T20,
    fontWeight: medium,
  );

  static final TextStyle _textHeading5m = TextStyle(
    height: _AppTextHeight.H16_24,
    fontSize: _AppTextSize.T16,
    fontWeight: medium,
  );

  static final TextStyle _textHeading6m = TextStyle(
    height: _AppTextHeight.H14_22,
    fontSize: _AppTextSize.T14,
    fontWeight: medium,
  );

  static final TextStyle _textBody1r = TextStyle(
    height: _AppTextHeight.H12_18,
    fontSize: _AppTextSize.T12,
    fontWeight: regular,
  );
}
