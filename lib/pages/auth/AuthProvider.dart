import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataError400.dart';
import 'package:example_flutter/models/dataLoginSuccess.dart';
import 'package:example_flutter/services/testAPI_services.dart';
import 'package:example_flutter/utils/config.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class AuthAPIProtocol {
  login({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(DataLoginSuccess data) onSuccess,
    required Function(dynamic error) onError,
  });

  register({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class AuthProvider extends AuthAPIProtocol {
  @override
  login(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(DataLoginSuccess data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "authenticate/login",
      params: params,
      option: option,
    ).post(
      beforeSend: (){
        beforeSend();
      },
      onSuccess: (data) {
        // print(data);sadasdassstu
        onSuccess(DataLoginSuccess.fromJson(data));
      },
      onError: (error) => {
        print("1"),
        onError(error)},
    );
  }

  @override
  register(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
            path: API.APIConfig + "authenticate/register",
            params: params,
            option: option)
        .post(
      beforeSend: () {
        beforeSend();
      },
      onSuccess: (data) {
        onSuccess(data);
      },
      onError: (error) => {onError(error)},
    );
  }
}
