import 'package:dio/dio.dart';
import 'package:example_flutter/models/infoUserMain.dart';
import 'package:example_flutter/services/testAPI_services.dart';
import 'package:example_flutter/utils/config.dart';

abstract class UserAPIProtocol {
  getInfoUserByToken({
    required Options option,
    required Function() beforeSend,
    required Function(InfoUserMain data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ProfileProvider extends UserAPIProtocol {
  @override
  getInfoUserByToken(
      {required Options option,
      required Function() beforeSend,
      required Function(InfoUserMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(path: API.APIConfig + "user/get-info", option: option).getAll(
        beforeSend: () {
      beforeSend();
    }, onSuccess: (res) {
      onSuccess(InfoUserMain.fromJson(res));
    }, onError: (error) {
      onError(error);
    });
  }
}
