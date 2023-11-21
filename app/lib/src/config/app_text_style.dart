// ignore_for_file: constant_identifier_names

part of 'app_theme.dart';

class _AppTextSize {
  static const double T32 = 32;
  static const double T28 = 28;
  static const double T24 = 24;

  static const double T20 = 20;
  static const double T18 = 18;
  static const double T16 = 16;
  static const double T14 = 14;
  static const double T12 = 12;
  static const double T10 = 10;
}

class _AppTextHeight {
  static const double H32_42 = 42 / 32;
  static const double H28_38 = 38 / 28;
  static const double H24_34 = 34 / 24;
  static const double H20_26 = 26 / 20;
  static const double H18_24 = 24 / 18;
  static const double H16_22 = 22 / 16;
  static const double H14_20 = 20 / 14;
  static const double H12_16 = 16 / 12;
  static const double H10_14 = 14 / 10;
}

abstract class _AppTextStyle {
  static FontWeight get bold => FontWeight.w700;

  static FontWeight get semiBold => FontWeight.w600;

  static FontWeight get regular => FontWeight.w400;

  static FontWeight get medium => FontWeight.w500;

  static TextTheme textTheme(AppColors appColor) {
    return TextTheme(
      // Heading 1
      displayLarge: _textHeading1.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 2
      displayMedium: _textHeading2.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 3
      displaySmall: _textHeading3.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 4
      headlineLarge: _textHeading4.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 5
      headlineMedium: _textHeading5.copyWith(
        color: appColor.grayColor,
      ),

      // Heading 6
      headlineSmall: _textHeading6.copyWith(
        color: appColor.grayColor,
      ),

      // Body 1
      bodyLarge: _textBody1.copyWith(
        color: appColor.grayColor,
      ),

      // Body 2
      bodyMedium: _textBody2.copyWith(
        color: appColor.grayColor,
      ),

      // Caption 1
      labelLarge: _textCaption1.copyWith(
        color: appColor.grayColor,
      ),

      // Caption 2
      labelMedium: _textCaption2.copyWith(
        color: appColor.grayColor,
      ),
    );
  }

  static final TextStyle _textHeading1 = TextStyle(
    height: _AppTextHeight.H32_42,
    fontSize: _AppTextSize.T32,
    fontWeight: bold,
  );

  static final TextStyle _textHeading2 = TextStyle(
    height: _AppTextHeight.H28_38,
    fontSize: _AppTextSize.T28,
    fontWeight: bold,
  );

  static final TextStyle _textHeading3 = TextStyle(
    height: _AppTextHeight.H24_34,
    fontSize: _AppTextSize.T24,
    fontWeight: bold,
  );

  static final TextStyle _textHeading4 = TextStyle(
    height: _AppTextHeight.H20_26,
    fontSize: _AppTextSize.T20,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading5 = TextStyle(
    height: _AppTextHeight.H18_24,
    fontSize: _AppTextSize.T18,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading6 = TextStyle(
    height: _AppTextHeight.H16_22,
    fontSize: _AppTextSize.T16,
    fontWeight: semiBold,
  );

  static final TextStyle _textBody1 = TextStyle(
    height: _AppTextHeight.H16_22,
    fontSize: _AppTextSize.T16,
    fontWeight: regular,
  );

  static final TextStyle _textBody2 = TextStyle(
    height: _AppTextHeight.H14_20,
    fontSize: _AppTextSize.T14,
    fontWeight: regular,
  );

  static final TextStyle _textCaption1 = TextStyle(
    height: _AppTextHeight.H12_16,
    fontSize: _AppTextSize.T12,
    fontWeight: regular,
  );

  static final TextStyle _textCaption2 = TextStyle(
    height: _AppTextHeight.H10_14,
    fontSize: _AppTextSize.T10,
    fontWeight: regular,
  );
}
