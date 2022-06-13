import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/pages/home/home_provider.dart';
import 'package:example_flutter/services/product_service.dart';
import 'package:example_flutter/utils/config.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final curentValue = 0.obs;
  ProductService productService = ProductService();
  final productData = DataMainProductAll.fromJson({}).obs;
  final productDataSales = DataMainProductAll.fromJson({}).obs;

  // void getAllProduct() async{
  //   var dio =Dio();
  //   final response = await dio.get(API.APIConfig+"product/mobile/all");
  //   print(response);
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    init();
    super.onInit();
  }

  init() {
    HomeProvider().getAll(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        productData.value = res;
        // ignore: avoid_print
        print('SUCCESSSSSSS $res');
      },
      onError: (e) {
        // ignore: avoid_print
        print('FAILSSSS $e');
      },
    );
    // HomeProvider().getAll(
    //   option: Options(),
    //   beforeSend: () {},
    //   onSuccess: (res) {
    //     print("object");
    //   },
    //   onError: (e) {
    //     print(e);
    //   },
    // );
  }
}
