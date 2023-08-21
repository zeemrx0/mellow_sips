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
        0xFF1A1A19,
        {
          100: Color(0xFFFFFFFF),
          200: Color(0xFFF5F3F2),
          300: Color(0xFFD9D8D7),
          400: Color(0xFFB2B0AF),
          500: Color(0xFF8A8887),
          600: Color(0xFF666564),
          700: Color(0xFF474746),
          800: Color(0xFF2E2D2D),
          900: Color(0xFF1A1A19),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFEA772B,
        {
          100: Color(0xFFFEF3EC),
          200: Color(0xFFFACAAA),
          300: Color(0xFFF8AB77),
          400: Color(0xFFF6914D),
          500: Color(0xFFEA772B),
          600: Color(0xFFC2540A),
          700: Color(0xFF944007),
          800: Color(0xFF612A05),
          900: Color(0xFF381600),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFEE212E,
        {
          100: Color(0xFFFEECED),
          200: Color(0xFFFAB4B9),
          300: Color(0xFFF88189),
          400: Color(0xFFF65560),
          500: Color(0xFFEE212E),
          600: Color(0xFFC20A16),
          700: Color(0xFF940711),
          800: Color(0xFF61050B),
          900: Color(0xFF380004),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF07B71F,
        {
          100: Color(0xFFE8FAEB),
          200: Color(0xFFA6F5B0),
          300: Color(0xFF57E96B),
          400: Color(0xFF25D73C),
          500: Color(0xFF07B71F),
          600: Color(0xFF0A951C),
          700: Color(0xFF057413),
          800: Color(0xFF03530D),
          900: Color(0xFF003307),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFD21C,
        {
          100: Color(0xFFFFFBEB),
          200: Color(0xFFFFEFAD),
          300: Color(0xFFFFE684),
          400: Color(0xFFFFDE5B),
          500: Color(0xFFFFD21C),
          600: Color(0xFFDBB20F),
          700: Color(0xFFA5860A),
          800: Color(0xFF6D5804),
          900: Color(0xFF6D5804),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          100: Color(0xFFF0F8FF),
          200: Color(0xFFB4DAFF),
          300: Color(0xFF7DC0FF),
          400: Color(0xFF4FA9FF),
          500: Color(0xFF188FFF),
          600: Color(0xFF096ECC),
          700: Color(0xFF06529A),
          800: Color(0xFF043B70),
          900: Color(0xFF011D38),
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
        0xFF1A1A19,
        {
          100: Color(0xFFFFFFFF),
          200: Color(0xFFF5F3F2),
          300: Color(0xFFD9D8D7),
          400: Color(0xFFB2B0AF),
          500: Color(0xFF8A8887),
          600: Color(0xFF666564),
          700: Color(0xFF474746),
          800: Color(0xFF2E2D2D),
          900: Color(0xFF1A1A19),
        },
      );

  @override
  MaterialColor get orangeColor => const MaterialColor(
        0xFFEA772B,
        {
          100: Color(0xFFFEF3EC),
          200: Color(0xFFFACAAA),
          300: Color(0xFFF8AB77),
          400: Color(0xFFF6914D),
          500: Color(0xFFEA772B),
          600: Color(0xFFC2540A),
          700: Color(0xFF944007),
          800: Color(0xFF612A05),
          900: Color(0xFF381600),
        },
      );

  @override
  MaterialColor get redColor => const MaterialColor(
        0xFFEE212E,
        {
          100: Color(0xFFFEECED),
          200: Color(0xFFFAB4B9),
          300: Color(0xFFF88189),
          400: Color(0xFFF65560),
          500: Color(0xFFEE212E),
          600: Color(0xFFC20A16),
          700: Color(0xFF940711),
          800: Color(0xFF61050B),
          900: Color(0xFF380004),
        },
      );

  @override
  MaterialColor get greenColor => const MaterialColor(
        0xFF07B71F,
        {
          100: Color(0xFFE8FAEB),
          200: Color(0xFFA6F5B0),
          300: Color(0xFF57E96B),
          400: Color(0xFF25D73C),
          500: Color(0xFF07B71F),
          600: Color(0xFF0A951C),
          700: Color(0xFF057413),
          800: Color(0xFF03530D),
          900: Color(0xFF003307),
        },
      );

  @override
  MaterialColor get yellowColor => const MaterialColor(
        0xFFFFD21C,
        {
          100: Color(0xFFFFFBEB),
          200: Color(0xFFFFEFAD),
          300: Color(0xFFFFE684),
          400: Color(0xFFFFDE5B),
          500: Color(0xFFFFD21C),
          600: Color(0xFFDBB20F),
          700: Color(0xFFA5860A),
          800: Color(0xFF6D5804),
          900: Color(0xFF6D5804),
        },
      );

  @override
  MaterialColor get blueColor => const MaterialColor(
        0xFF188FFF,
        {
          100: Color(0xFFF0F8FF),
          200: Color(0xFFB4DAFF),
          300: Color(0xFF7DC0FF),
          400: Color(0xFF4FA9FF),
          500: Color(0xFF188FFF),
          600: Color(0xFF096ECC),
          700: Color(0xFF06529A),
          800: Color(0xFF043B70),
          900: Color(0xFF011D38),
        },
      );
}
