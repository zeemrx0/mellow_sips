part of 'app_theme.dart';

abstract class AppColors {
  factory AppColors(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return AppDarkColors();
    }

    // Default
    return AppLightColors();
  }

  static AppColors get of => AppColors(Get.theme.brightness);

  Brightness get brightness;

  MaterialColor get primaryColor;

  MaterialColor get secondaryColor;

  MaterialColor get grayColor;

  MaterialColor get orangeColor;

  MaterialColor get redColor;

  MaterialColor get greenColor;

  MaterialColor get yellowColor;

  MaterialColor get blueColor;

  Color get blackColor;

  Color get mainTextColor;

  Color get subTextColor;

  Color get disabledColor;

  Color get borderColor;

  Color get disabledBorderColor;

  Color get dividerColor;

  Color get backgroundColor;

  Color get whiteColor;
}

class AppLightColors implements AppColors {
  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialColor get primaryColor => orangeColor;

  @override
  MaterialColor get secondaryColor => redColor;

  @override
  MaterialColor get grayColor => const MaterialColor(
        0xFF1A1A19,
        {
          50: Color(0xFFFFFFFF),
          100: Color(0xFFFAFAFA),
          200: Color(0xFFEDEDED),
          300: Color(0xFFE0E0E0),
          400: Color(0xFFD1D0CF),
          500: Color(0xFFBAB9B8),
          600: Color(0xFF919190),
          700: Color(0xFF6A6A69),
          800: Color(0xFF414141),
          900: Color(0xFF1A1A19),
          950: Color(0xFF000000),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFF46C1D,
        {
          50: Color(0xFFFFF3EB),
          100: Color(0xFFFFD8C2),
          200: Color(0xFFFFBE99),
          300: Color(0xFFFFA470),
          400: Color(0xFFFF8A47),
          500: Color(0xFFF46C1D),
          600: Color(0xFFCF550E),
          700: Color(0xFFA84003),
          800: Color(0xFF823000),
          900: Color(0xFF5C2200),
          950: Color(0xFF381500),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFEE212E,
        {
          50: Color(0xFFFFF0F1),
          100: Color(0xFFFCC5C9),
          200: Color(0xFFFA9BA1),
          300: Color(0xFFFA737C),
          400: Color(0xFFF54955),
          500: Color(0xFFEE212E),
          600: Color(0xFFC7121E),
          700: Color(0xFFA10610),
          800: Color(0xFF7A0008),
          900: Color(0xFF540006),
          950: Color(0xFF380004),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF08C722,
        {
          50: Color(0xFFE6FFE9),
          100: Color(0xFFAAFAB5),
          200: Color(0xFF7BED8A),
          300: Color(0xFF51E064),
          400: Color(0xFF2AD441),
          500: Color(0xFF08C722),
          600: Color(0xFF03A118),
          700: Color(0xFF03A118),
          800: Color(0xFF00540B),
          900: Color(0xFF003D08),
          950: Color(0xFF002E06),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFD52E,
        {
          50: Color(0xFFFFFBEB),
          100: Color(0xFFFFF5CC),
          200: Color(0xFFFFEEA8),
          300: Color(0xFFFFE680),
          400: Color(0xFFFFDD57),
          500: Color(0xFFFFD52E),
          600: Color(0xFFD4B01D),
          700: Color(0xFFA8890A),
          800: Color(0xFF745D03),
          900: Color(0xFF4D3D01),
          950: Color(0xFF332900),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          50: Color(0xFFF0F8FF),
          100: Color(0xFFD6EBFF),
          200: Color(0xFFA7D4FF),
          300: Color(0xFF75BCFF),
          400: Color(0xFF49A7FF),
          500: Color(0xFF188FFF),
          600: Color(0xFF096ECC),
          700: Color(0xFF0A569C),
          800: Color(0xFF063D71),
          900: Color(0xFF042F58),
          950: Color(0xFFFAFAFA),
        },
      );

  @override
  Color get blackColor => grayColor[950]!;

  @override
  Color get mainTextColor => grayColor[900]!;

  @override
  Color get subTextColor => grayColor[700]!;

  @override
  Color get disabledColor => grayColor[400]!;

  @override
  Color get borderColor => grayColor[400]!;

  @override
  Color get disabledBorderColor => grayColor[300]!;

  @override
  Color get dividerColor => grayColor[200]!;

  @override
  Color get backgroundColor => grayColor[100]!;

  @override
  Color get whiteColor => grayColor[50]!;
}

class AppDarkColors implements AppColors {
  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialColor get primaryColor => orangeColor;

  @override
  MaterialColor get secondaryColor => redColor;

  @override
  MaterialColor get grayColor => const MaterialColor(
        0xFF1A1A19,
        {
          50: Color(0xFFFFFFFF),
          100: Color(0xFFFAFAFA),
          200: Color(0xFFEDEDED),
          300: Color(0xFFE0E0E0),
          400: Color(0xFFD1D0CF),
          500: Color(0xFFBAB9B8),
          600: Color(0xFF919190),
          700: Color(0xFF6A6A69),
          800: Color(0xFF414141),
          900: Color(0xFF1A1A19),
          950: Color(0xFF000000),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFF46C1D,
        {
          50: Color(0xFFFFF3EB),
          100: Color(0xFFFFD8C2),
          200: Color(0xFFFFBE99),
          300: Color(0xFFFFA470),
          400: Color(0xFFFF8A47),
          500: Color(0xFFF46C1D),
          600: Color(0xFFCF550E),
          700: Color(0xFFA84003),
          800: Color(0xFF823000),
          900: Color(0xFF5C2200),
          950: Color(0xFF381500),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFEE212E,
        {
          50: Color(0xFFFFF0F1),
          100: Color(0xFFFCC5C9),
          200: Color(0xFFFA9BA1),
          300: Color(0xFFFA737C),
          400: Color(0xFFF54955),
          500: Color(0xFFEE212E),
          600: Color(0xFFC7121E),
          700: Color(0xFFA10610),
          800: Color(0xFF7A0008),
          900: Color(0xFF540006),
          950: Color(0xFF380004),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF08C722,
        {
          50: Color(0xFFE6FFE9),
          100: Color(0xFFAAFAB5),
          200: Color(0xFF7BED8A),
          300: Color(0xFF51E064),
          400: Color(0xFF2AD441),
          500: Color(0xFF08C722),
          600: Color(0xFF03A118),
          700: Color(0xFF03A118),
          800: Color(0xFF00540B),
          900: Color(0xFF003D08),
          950: Color(0xFF002E06),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFD52E,
        {
          50: Color(0xFFFFFBEB),
          100: Color(0xFFFFF5CC),
          200: Color(0xFFFFEEA8),
          300: Color(0xFFFFE680),
          400: Color(0xFFFFDD57),
          500: Color(0xFFFFD52E),
          600: Color(0xFFD4B01D),
          700: Color(0xFFA8890A),
          800: Color(0xFF745D03),
          900: Color(0xFF4D3D01),
          950: Color(0xFF332900),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          50: Color(0xFFF0F8FF),
          100: Color(0xFFD6EBFF),
          200: Color(0xFFA7D4FF),
          300: Color(0xFF75BCFF),
          400: Color(0xFF49A7FF),
          500: Color(0xFF188FFF),
          600: Color(0xFF096ECC),
          700: Color(0xFF0A569C),
          800: Color(0xFF063D71),
          900: Color(0xFF042F58),
          950: Color(0xFFFAFAFA),
        },
      );

  @override
  Color get blackColor => grayColor[950]!;

  @override
  Color get mainTextColor => grayColor[900]!;

  @override
  Color get subTextColor => grayColor[700]!;

  @override
  Color get disabledColor => grayColor[400]!;

  @override
  Color get borderColor => grayColor[400]!;

  @override
  Color get disabledBorderColor => grayColor[300]!;

  @override
  Color get dividerColor => grayColor[200]!;

  @override
  Color get backgroundColor => grayColor[100]!;

  @override
  Color get whiteColor => grayColor[50]!;
}
