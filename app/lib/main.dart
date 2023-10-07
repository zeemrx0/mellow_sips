import 'package:app/src/components/main/overlay/app_loading_overlay_widget.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

import 'src/config/app_theme.dart';
import 'src/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataProvider.inject();
  DomainProvider.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLoadingOverlayWidget.configure(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      enableLog: true,
      locale: Get.deviceLocale,
      supportedLocales: R.appLocalizationDelegate.supportedLocales,
      localizationsDelegates: const [
        R.appLocalizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      getPages: AppPages.routes,
      initialRoute: Routes.storeDetail,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.full,
      builder: AppLoadingOverlayWidget.init(),
    );
  }
}
