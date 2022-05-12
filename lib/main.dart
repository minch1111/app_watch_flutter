import 'dart:async';
// import 'package:example_flutter/pages/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZoned<Future<void>>(() async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {},
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}