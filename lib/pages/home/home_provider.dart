import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/services/testAPI_services.dart';
import 'package:example_flutter/utils/config.dart';

abstract class HomeAPIProtocol {
  getAll({
    required Options option,
    required Function() beforeSend,
    required Function(DataMainProductAll data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class HomeProvider extends HomeAPIProtocol {
  @override
  getAll(
      {required Options option,
      required Function() beforeSend,
      required Function(DataMainProductAll data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "product/mobile/all",
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(DataMainProductAll.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  getPromtional(
      {required Options option,
      required Function() beforeSend,
      required Function(DataMainProductAll data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(path: API.APIConfig + "product/mobile/???", option: option)
        .getPromtion(
            beforeSend: () => {beforeSend()},
            onSuccess: (data) {
              onSuccess(DataMainProductAll.fromJson(data));
            },
            onError: (error) => {onError(error)});
  }
}
