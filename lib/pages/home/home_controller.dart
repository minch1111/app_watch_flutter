import 'package:example_flutter/models/bannerMain.dart';
import 'package:example_flutter/models/brand.dart';
import 'package:example_flutter/models/brandMain.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/pages/home/home_provider.dart';
import 'package:example_flutter/services/product_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeController extends GetxController {
  final curentValue = 0.obs;
  ProductService productService = ProductService();
  final productDataSales = DataMainProductAll.fromJson({}).obs;
  final brandData = BrandMain.fromJson({}).obs;
  final banner = BannerMain.fromJson({}).obs;
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
    HomeProvider().getPromtional(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        productDataSales.value = res;
        // ignore: avoid_print
      },
      onError: (e) {
        // ignore: avoid_print
        print('FAILSSSS $e');
      },
    );

    HomeProvider().getBanner(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        banner.value = res;
        // ignore: avoid_print
      },
      onError: (e) {
        // ignore: avoid_print
        print('FAILSSSS $e');
      },
    );

    HomeProvider().getAllBranch(
      option: Options(),
      beforeSend: () {},
      onSuccess: (res) {
        // res.Data
        // final data = Brand.fromJson(jsonDecode(res.Data.toString()));
        // print(data);
        // brandData.value = Brand.fromJson(res.Data);
        // print(brandData.value);
        brandData.value = res;
      },
      onError: (e) {
        print(e);
      },
    );
  }
}
