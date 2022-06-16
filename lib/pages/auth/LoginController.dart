// ignore: file_names
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataError400.dart';
import 'package:example_flutter/models/dataLoginSuccess.dart';
import 'package:example_flutter/pages/auth/AuthProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final account = TextEditingController();
  final password = TextEditingController();
  final dataError400 = DataError400.fromJson({}).obs;

  loginAction(String account, String password,
      {required Function() beforeSend,
      required Function(DataLoginSuccess data) onSuccess,
      required Function(dynamic error) onError}) {
    AuthProvider().login(
        params: {
          'UserName': account,
          'Password': password,
        },
        option: Options(
          headers: {"Content-Type": "application/json"},
        ),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (data) {
          onSuccess(data);
          // printres);
        },
        onError: (e) {
          print(e.response);
          final s = e.response.toString();
          dataError400.value = DataError400.fromJson(jsonDecode(s));
          if (dataError400.value.Message != null) {
            onError(dataError400.value.Message);
          } else {
            onError(e.response);
          }
        });
  }
}
