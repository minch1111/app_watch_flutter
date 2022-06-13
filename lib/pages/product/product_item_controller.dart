import 'package:dio/dio.dart';
import 'package:example_flutter/models/productDetailForItem.dart';
import 'package:example_flutter/pages/product/product_provider.dart';
import 'package:get/get.dart';
import '../../models/dataDetailMain.dart';

class ProductItemController extends GetxController {
  final curentValue = 0.obs;
  final curentValue2 = 0.obs;
  late bool isLoading = true;

  final numberCart = 1.obs;
  final productDetail = ProductDetailForItem.fromJson({}).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  loadDetailProduct(String id,
      {required Function() beforeSend,
      required Function(DataDetailMain data) onSuccess,
      required Function(dynamic e) onError}) {
    ProductProvider().getDetail(
        id: id,
        option: Options(),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (res) {
          isLoading = false;
          update();
          onSuccess(res);
          print(res);
        },
        onError: (e) {
          update();
          print(e);
          onError(e);
        });
  }
}
