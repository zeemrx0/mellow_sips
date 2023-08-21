import 'package:app/src/pages/demo/demo_controller.dart';
import 'package:app/src/pages/login/login_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/pages/verify/verify_registration_controller.dart';
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
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.verifyRegistration,
      page: () => const VerifyRegistrationPage(),
      binding: VerifyRegistrationBinding(),
    ),
  ];
}
