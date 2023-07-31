import 'package:app/src/pages/cart/cart_controller.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

part 'app_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
  ];
}
