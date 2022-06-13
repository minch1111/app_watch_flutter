import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/pages/product/product_provider.dart';
import 'package:example_flutter/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final currentVal = 0.obs;
  ProductService productService = ProductService();
  final productData = DataMainProductAll.fromJson({}).obs;

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    init();
    super.onInit();
  }

  init(){
    ProductProvider().getAll(
      option :Options(),
      beforeSend:(){},
      onSuccess: (res){
        productData.value =res;
      },
      onError: (e){
        print(e);
      }
    );
  }
}