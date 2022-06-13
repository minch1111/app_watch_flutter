import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataError400.dart';
import 'package:example_flutter/pages/auth/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final dataError400 = DataError400.fromJson({}).obs;




  register(String fullname,String username, String password, String email, String phone,
      String address,
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    AuthProvider().register(
        params: {
          "Username": username,
          "Password": password,
          "ConfirmPassword": password,
          "FullName": fullname,
          "Email": email,
          "Phone": phone,
          "Birth": "2000-12-19",
          "Gender": "Nam",
          "Province": "Thành Phố Hồ Chí Minh",
          "District": "Hóc Môn",
          "Ward": "Xã Xuân Thới Đông",
          "Address": address
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
        onError: (e) {
          print(e.response);
          final s = e.response.toString();
          dataError400.value = DataError400.fromJson(jsonDecode(s));
          onError(dataError400.value.Message);
        });
  }
}
