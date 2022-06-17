// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:example_flutter/models/infoUserMain.dart';
import 'package:example_flutter/pages/profile/profile_provider.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class ProfileController extends GetxController {
  String token = "";
  final localStorage = LocalStorage("token");

  final infoUser = InfoUserMain.fromJson({}).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    token = localStorage.getItem("token") ?? "";
    if (token.isEmpty == false) {
      loadInfoUser(
          beforeSend: () {},
          onSuccess: (res) {
            print("init");
            infoUser.value = res;
          },
          onError: (er) {
            print("Loi $er");
          });
    }
    super.onInit();
  }

  loadInfoUser(
      {required Function() beforeSend,
      required Function(InfoUserMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ProfileProvider().getInfoUserByToken(
        option: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        });
  }
}
