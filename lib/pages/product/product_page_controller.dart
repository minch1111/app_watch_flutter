import 'package:dio/dio.dart';
import 'package:example_flutter/models/brandMain.dart';
import 'package:example_flutter/models/categoryMain.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/models/dataSearch.dart';
import 'package:example_flutter/pages/product/product_provider.dart';
import 'package:example_flutter/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final currentVal = 0.obs;
  ProductService productService = ProductService();
  final productData = DataMainProductAll.fromJson({}).obs;
  final brandData = BrandMain.fromJson({}).obs;
  final categoryData = CategoryMain.fromJson({}).obs;

  final keySearch = TextEditingController();
  String idCate = "";
  String idBrand = "";
  int keySort = 0;

  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    init();
    super.onInit();
  }

  init() {
    ProductProvider().getAll(
        option: Options(),
        beforeSend: () {},
        onSuccess: (res) {
          productData.value = res;
        },
        onError: (e) {
          print(e);
        });
  }

  filter(String keySearch, String idCate, String idBrand, int keySort,
      {required Function() beforeSend,
      required Function(DataMainProductAll data) onSuccess,
      required Function(dynamic error) onError}) {
    ProductProvider().filter(
        params: {
          "KeySearch": keySearch,
          "CategorySearch": idCate,
          "BrandSearch": idBrand,
          "SortPrice": keySort
        },
        option: Options(
          headers: {"Content-Type": "application/json"},
        ),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (err) {
          onError(err);
        });
  }

  testfilter(String keySearch, String idCate, String idBrand, int keySort) {
    var params = {
      "KeySearch": keySearch,
      "CategorySearch": idCate,
      "BrandSearch": idBrand,
      "SortPrice": keySort
    };
    print(params);
  }

  loadBrand(
      {required Function() beforeSend,
      required Function(BrandMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ProductProvider().getAllBranch(
        option: Options(),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (res) {
          onSuccess(res);
          print("ok $res");
          // brandData.value = res;
        },
        onError: (error) {
          onError(error);
        });
  }

  loadCategory(
      {required Function() beforeSend,
      required Function(CategoryMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ProductProvider().getCategory(
        option: Options(),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (res) {
          onSuccess(res);
          print("ok $res");
          // brandData.value = res;
        },
        onError: (error) {
          onError(error);
        });
  }
}
