import 'package:resources/src/generated/assets/assets.gen.dart';
import 'package:resources/src/generated/assets/fonts.gen.dart';
import 'package:resources/src/generated/strings/l10n.dart';

class R {
  static Strings strings = Strings.current;
  static const AppLocalizationDelegate appLocalizationDelegate =
      Strings.delegate;

  static $AssetsSvgsGen svgs = Assets.svgs;
  static $AssetsPngsGen pngs = Assets.pngs;

  static AppFontFamily fontFamily = AppFontFamily();
}

class AppFontFamily {
  final String comfortaa;
  final String workSans;

  AppFontFamily()
      : comfortaa = FontFamily.comfortaa,
        workSans = FontFamily.workSans;
}
