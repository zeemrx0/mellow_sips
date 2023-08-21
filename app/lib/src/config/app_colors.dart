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
        0xFF0D0D0D,
        {
          50: Color(0xFFF2F2F2),
          100: Color(0xFFE6E6E6),
          200: Color(0xFFCCCCCC),
          300: Color(0xFFB3B3B3),
          400: Color(0xFF999999),
          500: Color(0xFF646464),
          600: Color(0xFF666666),
          700: Color(0xFF4D4D4D),
          800: Color(0xFF333333),
          900: Color(0xFF1A1A1A),
          950: Color(0xFF0D0D0D),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFF46E21,
        {
          50: Color(0xFFFEEFE7),
          100: Color(0xFFFDDFCE),
          200: Color(0xFFFAC09E),
          300: Color(0xFFF8A06D),
          400: Color(0xFFF5803D),
          500: Color(0xFFF46E21),
          600: Color(0xFFC24D0A),
          700: Color(0xFF923A07),
          800: Color(0xFF612705),
          900: Color(0xFF311302),
          950: Color(0xFF180A01),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFFF2424,
        {
          50: Color(0xFFFFE5E5),
          100: Color(0xFFFFCCCC),
          200: Color(0xFFFF9999),
          300: Color(0xFFFF6666),
          400: Color(0xFFFF3333),
          500: Color(0xFFFF2424),
          600: Color(0xFFCC0000),
          700: Color(0xFF990000),
          800: Color(0xFF660000),
          900: Color(0xFF330000),
          950: Color(0xFF1A0000),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF00C91B,
        {
          50: Color(0xFFE5FFE9),
          100: Color(0xFFCCFFD3),
          200: Color(0xFF99FFA7),
          300: Color(0xFF66FF7A),
          400: Color(0xFF33FF4E),
          500: Color(0xFF00C91B),
          600: Color(0xFF00CC1B),
          700: Color(0xFF009914),
          800: Color(0xFF00660E),
          900: Color(0xFF003307),
          950: Color(0xFF001A03),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFED8A,
        {
          50: Color(0xFFFFFBE5),
          100: Color(0xFFFFF7CC),
          200: Color(0xFFFFF099),
          300: Color(0xFFFFE866),
          400: Color(0xFFFFE033),
          500: Color(0xFFFFED8A),
          600: Color(0xFFCCAD00),
          700: Color(0xFF998200),
          800: Color(0xFF665700),
          900: Color(0xFF332B00),
          950: Color(0xFF1A1600),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          50: Color(0xFFE5F3FF),
          100: Color(0xFFCCE6FF),
          200: Color(0xFF99CEFF),
          300: Color(0xFF66B5FF),
          400: Color(0xFF339CFF),
          500: Color(0xFF188FFF),
          600: Color(0xFF0069CC),
          700: Color(0xFF004F99),
          800: Color(0xFF003566),
          900: Color(0xFF001A33),
          950: Color(0xFF000D1A),
        },
      );
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
        0xFF0D0D0D,
        {
          50: Color(0xFFF2F2F2),
          100: Color(0xFFE6E6E6),
          200: Color(0xFFCCCCCC),
          300: Color(0xFFB3B3B3),
          400: Color(0xFF999999),
          500: Color(0xFF646464),
          600: Color(0xFF666666),
          700: Color(0xFF4D4D4D),
          800: Color(0xFF333333),
          900: Color(0xFF1A1A1A),
          950: Color(0xFF0D0D0D),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFF46E21,
        {
          50: Color(0xFFFEEFE7),
          100: Color(0xFFFDDFCE),
          200: Color(0xFFFAC09E),
          300: Color(0xFFF8A06D),
          400: Color(0xFFF5803D),
          500: Color(0xFFF46E21),
          600: Color(0xFFC24D0A),
          700: Color(0xFF923A07),
          800: Color(0xFF612705),
          900: Color(0xFF311302),
          950: Color(0xFF180A01),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFFF2424,
        {
          50: Color(0xFFFFE5E5),
          100: Color(0xFFFFCCCC),
          200: Color(0xFFFF9999),
          300: Color(0xFFFF6666),
          400: Color(0xFFFF3333),
          500: Color(0xFFFF2424),
          600: Color(0xFFCC0000),
          700: Color(0xFF990000),
          800: Color(0xFF660000),
          900: Color(0xFF330000),
          950: Color(0xFF1A0000),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF00C91B,
        {
          50: Color(0xFFE5FFE9),
          100: Color(0xFFCCFFD3),
          200: Color(0xFF99FFA7),
          300: Color(0xFF66FF7A),
          400: Color(0xFF33FF4E),
          500: Color(0xFF00C91B),
          600: Color(0xFF00CC1B),
          700: Color(0xFF009914),
          800: Color(0xFF00660E),
          900: Color(0xFF003307),
          950: Color(0xFF001A03),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFED8A,
        {
          50: Color(0xFFFFFBE5),
          100: Color(0xFFFFF7CC),
          200: Color(0xFFFFF099),
          300: Color(0xFFFFE866),
          400: Color(0xFFFFE033),
          500: Color(0xFFFFED8A),
          600: Color(0xFFCCAD00),
          700: Color(0xFF998200),
          800: Color(0xFF665700),
          900: Color(0xFF332B00),
          950: Color(0xFF1A1600),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          50: Color(0xFFE5F3FF),
          100: Color(0xFFCCE6FF),
          200: Color(0xFF99CEFF),
          300: Color(0xFF66B5FF),
          400: Color(0xFF339CFF),
          500: Color(0xFF188FFF),
          600: Color(0xFF0069CC),
          700: Color(0xFF004F99),
          800: Color(0xFF003566),
          900: Color(0xFF001A33),
          950: Color(0xFF000D1A),
        },
      );
}
