import 'package:dio/dio.dart';
import 'package:example_flutter/models/newsMain.dart';

import 'package:example_flutter/services/testAPI_services.dart';

import 'package:example_flutter/utils/config.dart';

abstract class BlogAPIProtocol {
  getBlogs({
    required Options option,
    required Function() beforeSend,
    required Function(NewsMain data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class BlogProvider extends BlogAPIProtocol {
  @override
  getBlogs(
      {required Options option,
      required Function() beforeSend,
      required Function(NewsMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(option: option,path: API.APIConfig +"news/mobile/all").getAll(beforeSend: (){
      beforeSend();
    }, onSuccess: (res){
      onSuccess(NewsMain.fromJson(res));
    }, onError: (err){
      onSuccess(err);
    });
  }
}
