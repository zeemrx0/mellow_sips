
import 'package:app/src/pages/demo/demo_controller.dart';
import 'package:get/get.dart';

part 'app_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.demo,
      page: () => const DemoPage(),
      binding: DemoBinding(),
    ),
  ];
}
