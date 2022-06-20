import 'package:dio/dio.dart';
import 'package:example_flutter/models/brandMain.dart';
import 'package:example_flutter/models/categoryMain.dart';
import 'package:example_flutter/models/dataDetailMain.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
// import 'package:example_flutter/models/dataSearch.dart';
import 'package:example_flutter/services/testAPI_services.dart';
// import 'package:example_flutter/utils/app_constant.dart';
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
  getAllBranch({
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });

  getCategory({
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });

  filter({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
  createUpdateCart({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
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
      {required String id,
      required Options option,
      required Function() beforeSend,
      required Function(DataDetailMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "product/details/mobile/$id",
      option: option,
    ).getAll(
      beforeSend: () {
        beforeSend();
        print(id);
      },
      onSuccess: (data) {
        onSuccess(DataDetailMain.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getAllBranch(
      {required Options option,
      required Function() beforeSend,
      required Function(BrandMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "brand/all",
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(BrandMain.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  getCategory(
      {required Options option,
      required Function() beforeSend,
      required Function(CategoryMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
      path: API.APIConfig + "category/all",
      option: option,
    ).getAll(
      beforeSend: () => {beforeSend()},
      onSuccess: (data) {
        onSuccess(CategoryMain.fromJson(data));
      },
      onError: (error) => {onError(error)},
    );
  }

  @override
  createUpdateCart({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError}) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  filter(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(DataMainProductAll data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
            option: option,
            params: params,
            path: API.APIConfig + "product/search")
        .post(beforeSend: () {
      beforeSend();
    }, onSuccess: (res) {
      onSuccess(DataMainProductAll.fromJson(res));
    }, onError: (error) {
      onError(error);
    });
  }
}
