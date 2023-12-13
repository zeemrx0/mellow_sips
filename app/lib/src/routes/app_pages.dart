import 'package:app/src/pages/appMenu/app_nav_menu_controller.dart';
import 'package:app/src/pages/cart/cart_controller.dart';
import 'package:app/src/pages/carts/cart_list_controller.dart';
import 'package:app/src/pages/changePassword/change_password_controller.dart';
import 'package:app/src/pages/checkout/checkout_controller.dart';
import 'package:app/src/pages/confirmOrder/confirm_order_controller.dart';
import 'package:app/src/pages/demo/demo_controller.dart';
import 'package:app/src/pages/home/searchStore/search_store_controller.dart';
import 'package:app/src/pages/intro/intro_controller.dart';
import 'package:app/src/pages/login/login_controller.dart';
import 'package:app/src/pages/notification/notification_controller.dart';
import 'package:app/src/pages/orderStatus/order_status_controller.dart';
import 'package:app/src/pages/orders/orderCompleteAlertPage/order_completed_alert_controller.dart';
import 'package:app/src/pages/orders/orderDetail/order_detail_controller.dart';
import 'package:app/src/pages/orders/orderList/order_list_controller.dart';
import 'package:app/src/pages/product/product_detail_controller.dart';
import 'package:app/src/pages/qrScan/qr_scan_controller.dart';
import 'package:app/src/pages/register/register_controller.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/pages/review/store_review_controller.dart';
import 'package:app/src/pages/store/coffeeStoreList/coffee_store_list_controller.dart';
import 'package:app/src/pages/store/milkTeaStoreList/milk_tea_store_list_controller.dart';
import 'package:app/src/pages/store/promotingStoreList/promoting_store_list_controller.dart';
import 'package:app/src/pages/store/qualifiedStoreList/qualified_store_list_controller.dart';
import 'package:app/src/pages/store/storeDetail/store_detail_controller.dart';
import 'package:app/src/pages/storeList/store_list_controller.dart';
import 'package:app/src/pages/updateProfile/update_profile_controller.dart';
import 'package:app/src/pages/verify/verify_registration_controller.dart';
import 'package:app/src/pages/voucherList/voucher_list_controller.dart';
import 'package:app/src/pages/welcome/welcome_controller.dart';
import 'package:get/get.dart';

part './app_binding.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.demo,
      page: () => const DemoPage(),
      binding: DemoBinding(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => const IntroPage(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: Routes.appNavMenu,
      page: () => const AppNavMenuPage(),
      binding: AppNavMenuBinding(),
    ),
    GetPage(
      name: Routes.updateProfile,
      page: () => const UpdateProfilePage(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.qrScan,
      page: () => const QrScanPage(),
      binding: QrScanBinding(),
    ),

    // Home
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.coffeeStores,
      page: () => const CoffeeStoreListPage(),
      binding: CoffeeStoreListBinding(),
    ),
    GetPage(
      name: Routes.milkTeaStores,
      page: () => const MilkTeaStoreListPage(),
      binding: MilkTeaStoreListBinding(),
    ),
    GetPage(
      name: Routes.qualifiedStores,
      page: () => const QualifiedStoreListPage(),
      binding: QualifiedStoreListBinding(),
    ),
    GetPage(
      name: Routes.promotingStores,
      page: () => const PromotingStoreListPage(),
      binding: PromotingStoreListBinding(),
    ),

    // Auth
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

    // Store
    GetPage(
      name: Routes.stores,
      page: () => const StoreListPage(),
      binding: StoreListBinding(),
    ),
    GetPage(
      name: Routes.searchStore,
      page: () => const SearchStorePage(),
      binding: SearchStoreBinding(),
    ),
    GetPage(
      name: Routes.storeDetail,
      page: () => const StoreDetailPage(),
      binding: StoreDetailBinding(),
    ),
    GetPage(
      name: Routes.productDetail,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    // Cart
    GetPage(
      name: Routes.carts,
      page: () => const CartListPage(),
      binding: CartListBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.vouchers,
      page: () => const VoucherListPage(),
      binding: VoucherListBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutPage(),
      binding: CheckoutBinding(),
    ),

    // Order
    GetPage(
      name: Routes.orderStatus,
      page: () => const OrderStatusPage(),
      binding: OrderStatusBinding(),
    ),
    GetPage(
      name: Routes.confirmOrder,
      page: () => const ConfirmOrderPage(),
      binding: ConfirmOrderBinding(),
    ),
    GetPage(
      name: Routes.orders,
      page: () => const OrderListPage(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: Routes.orderDetail,
      page: () => const OrderDetailPage(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: Routes.orderCompletedAlert,
      page: () => const OrderCompletedAlertPage(),
      binding: OrderCompletedAlertBinding(),
    ),

    // Notification
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),

    // Review
    GetPage(
      name: Routes.storeReviews,
      page: () => const StoreReviewPage(),
      binding: StoreReviewBinding(),
    ),
  ];
}
