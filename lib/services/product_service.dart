import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';

import '../utils/config.dart';

class ProductService {
  final productData = DataMainProductAll.fromJson({});
  Future<DataMainProductAll?> getAllProduct() async {
    var dio = Dio();
    final res = await dio.get(API.APIConfig + "product/mobile/all");
    if (res != null) {
      print(res);
      productData.Data = res.data;
    }
  }
}
