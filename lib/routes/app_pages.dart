import 'package:example_flutter/pages/cart/cart_page.dart';
import 'package:example_flutter/pages/splash/splash_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:get/get.dart';

import '../pages/dashboard/dashboard_binding.dart';
import '../pages/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeApp(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: ()=> const CartPage(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAIL,
      page: ()=> const ProductItem(),
    ),

  ];
}
