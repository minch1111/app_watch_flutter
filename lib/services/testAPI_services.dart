import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  late final dynamic params;
  late final dynamic path;
  late final Options option;
  late final dynamic id;
  late final dynamic username;
  late final dynamic password;

  ApiService(
      {this.params,
      this.path,
      this.id,
      this.username,
      this.password,
      required this.option});

  Dio dio = Dio();

  void getAll({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    print(path);
    beforeSend();
    dio.get(path, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void getPromtion({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    dio.get(path, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    beforeSend();
    dio
        .get(path,
            queryParameters: Map<String, dynamic>.from(params), options: option)
        .then((res) {
      onSuccess(res.data);
    }).catchError((e) {
      onError(e);
    });
  }

  void post({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    print(path);
    print("payload :"+ params.toString());
    beforeSend();
    dio.post(path, data: params, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  void delete({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    print(path);
    beforeSend();
    dio.delete(path, data: params, options: option).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }
}
