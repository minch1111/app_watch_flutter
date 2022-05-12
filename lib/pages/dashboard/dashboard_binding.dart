// import 'package:example_flutter/pages/cart/cart_controller.dart';
import 'package:example_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:example_flutter/pages/home/home_controller.dart';
// import 'package:example_flutter/pages/product/product_item.dart';
import 'package:example_flutter/pages/product/product_item_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProductItemController>(() => ProductItemController());
  }
}