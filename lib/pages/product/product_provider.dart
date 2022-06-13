import 'package:dio/dio.dart';
import 'package:example_flutter/models/dataDetailMain.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/services/testAPI_services.dart';
import 'package:example_flutter/utils/config.dart';

abstract class ProductAPIProtocol {
  getAll({
    required Options option,
    required Function() beforeSend,
    required Function(DataMainProductAll data) onSuccess,
    required Function(dynamic error) onError,
  });
   getDetail({
     required String id,
    required Options option,
    required Function() beforeSend,
    required Function(DataDetailMain data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class ProductProvider extends ProductAPIProtocol {
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

  @override
  getDetail(
      {required String id ,required Options option,
      required Function() beforeSend,
      required Function(DataDetailMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "product/details/mobile/$id",
      option: option,
    ).getAll(
      beforeSend: (){beforeSend();print(id);},
      onSuccess: (data) {
        onSuccess(DataDetailMain.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }
}