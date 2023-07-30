part of 'app_theme.dart';

abstract class AppColors {
  factory AppColors(Brightness brightness) {
    // if (brightness == Brightness.dark) {
    //   return AppDarkColors();
    // }
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
        0xFF646464,
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

// class AppDarkColors implements AppColors {
//   @override
//   Brightness get brightness => Brightness.dark;

//   @override
//   MaterialColor get primaryColor => tealColor;

//   @override
//   MaterialColor get secondaryColor => yellowColor;

//   @override
//   Color get errorColor => redColor[5] ?? redColor;

//   @override
//   Color get warningColor => yellowColor[5] ?? yellowColor;

//   @override
//   Color get successColor => greenColor[5] ?? greenColor;

//   @override
//   Color get processInformColor => lightBlueColor[5] ?? lightBlueColor;

//   @override
//   Color get cancelColor => grayColor[6] ?? grayColor;

//   @override
//   Color get mainTextColor => grayColor[10] ?? grayColor;

//   @override
//   Color get subTextColor => grayColor[7] ?? grayColor;

//   @override
//   Color get disableColor => grayColor[5] ?? grayColor;

//   @override
//   Color get borderColor => grayColor[4] ?? grayColor;

//   @override
//   Color get dividerColor => grayColor[3] ?? grayColor;

//   @override
//   Color get backgroundColor => grayColor[2] ?? grayColor;

//   @override
//   Color get whiteColor => grayColor[1] ?? grayColor;

//   @override
//   MaterialColor get grayColor => const MaterialColor(
//         0xFF000D0B,
//         {
//           1: Color(0xFFFFFFFF),
//           2: Color(0xFFF5F6FA),
//           3: Color(0xFFEBECF0),
//           4: Color(0xFFD4D5D9),
//           5: Color(0xFFBBBCBF),
//           6: Color(0xFF8A8B8C),
//           7: Color(0xFF575859),
//           8: Color(0xFF414142),
//           9: Color(0xFF2A2A2B),
//           10: Color(0xFF000D0B),
//         },
//       );

//   @override
//   MaterialColor get tealColor => const MaterialColor(
//         0xFF00a499,
//         {
//           1: Color(0xFFE5F6F5),
//           2: Color(0xFFC7EBE9),
//           3: Color(0xFF8CD6D1),
//           4: Color(0xFFE5F6F5),
//           5: Color(0xFF00a499),
//           6: Color(0xFF00867D),
//           7: Color(0xFF00685E),
//           8: Color(0xFF005149),
//           9: Color(0xFF003B35),
//           10: Color(0xFF002B27),
//         },
//       );

//   @override
//   MaterialColor get yellowColor => const MaterialColor(
//         0xFFFFB81C,
//         {
//           1: Color(0xFFFFF8E8),
//           2: Color(0xFFFFEFCD),
//           3: Color(0xFFFFDF99),
//           4: Color(0xFFFFCD60),
//           5: Color(0xFFFFB81C),
//           6: Color(0xFFCC9619),
//           7: Color(0xFF997415),
//           8: Color(0xFF735A13),
//           9: Color(0xFF4C4010),
//           10: Color(0xFF332F0E),
//         },
//       );

//   @override
//   MaterialColor get redColor => const MaterialColor(
//         0xFFF5222D,
//         {
//           1: Color(0xFFFEE9EA),
//           2: Color(0xFFFDCED1),
//           3: Color(0xFFFB9CA0),
//           4: Color(0xFFF8646C),
//           5: Color(0xFFF5222D),
//           6: Color(0xFFC91C25),
//           7: Color(0xFF9A151C),
//           8: Color(0xFF7B1117),
//           9: Color(0xFF580C10),
//           10: Color(0xFF42090C),
//         },
//       );

//   @override
//   MaterialColor get lightBlueColor => const MaterialColor(
//         0xFF0089B6,
//         {
//           1: Color(0xFFE5F3F8),
//           2: Color(0xFFC7E5EF),
//           3: Color(0xFF8CCADE),
//           4: Color(0xFF4CACCC),
//           5: Color(0xFF0089B6),
//           6: Color(0xFF007094),
//           7: Color(0xFF005772),
//           8: Color(0xFF004558),
//           9: Color(0xFF00323E),
//           10: Color(0xFF00262D),
//         },
//       );

//   @override
//   MaterialColor get greenColor => const MaterialColor(
//         0xFF00A100,
//         {
//           1: Color(0xFFE5F6E5),
//           2: Color(0xFFC7EAC7),
//           3: Color(0xFF8CD58C),
//           4: Color(0xFF4CBD4C),
//           5: Color(0xFF00A100),
//           6: Color(0xFF008302),
//           7: Color(0xFF006604),
//           8: Color(0xFF005006),
//           9: Color(0xFF003908),
//           10: Color(0xFF002B09),
//         },
//       );
//   @override
//   MaterialColor get daybreakBlueColor => const MaterialColor(
//         0xFF1890FF,
//         {
//           1: Color(0xFFE0F5FF),
//           2: Color(0xFFBAE7FF),
//           3: Color(0xFF8AD2FF),
//           4: Color(0xFF4DB4FF),
//           5: Color(0xFF1890FF),
//           6: Color(0xFF096DD9),
//           7: Color(0xFF005BBD),
//           8: Color(0xFF0049A3),
//           9: Color(0xFF003073),
//           10: Color(0xFF001D4D),
//         },
//       );
// }
