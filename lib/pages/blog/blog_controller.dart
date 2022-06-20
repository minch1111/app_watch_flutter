import 'package:dio/dio.dart';
import 'package:example_flutter/models/newsMain.dart';
import 'package:example_flutter/pages/blog/blog_provider.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  final blog = NewsMain.fromJson({}).obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadBlogs({
    required Function() beforeSend,
    required Function(NewsMain data) onSuccess,
    required Function(dynamic error) onError
  }){
 BlogProvider().getBlogs(
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