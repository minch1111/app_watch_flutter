import 'package:dio/dio.dart';
import 'package:example_flutter/models/cart.dart';
import 'package:example_flutter/models/dataCart.dart';
// import 'package:example_flutter/models/dataSearch.dart';
import 'package:example_flutter/services/testAPI_services.dart';
// import 'package:example_flutter/utils/app_constant.dart';
import 'package:example_flutter/utils/config.dart';

abstract class CartAPIProtocol {
  getCart({
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });

  deleteAllCart({
    required String id,
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

  confirmPay({
    required Map<String, dynamic> params,
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
}

class CartProvider extends CartAPIProtocol {
  @override
  getCart(
      {required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(option: option, path: API.APIConfig + "order/get-info").getAll(
        beforeSend: () {
      beforeSend();
    }, onSuccess: (data) {
      onSuccess(data);
    }, onError: (err) {
      onError(err);
    });
  }

  @override
  deleteAllCart(
      {required String id,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(option: option, path: API.APIConfig + "order/delete/$id").delete(
        beforeSend: () {
      beforeSend();
    }, onSuccess: (data) {
      onSuccess(data);
    }, onError: (err) {
      onError(err);
    });
  }

  @override
  createUpdateCart(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
            option: option,
            params: params,
            path: API.APIConfig + "order/create")
        .post(beforeSend: () {
      beforeSend();
    }, onSuccess: (data) {
      onSuccess(data);
    }, onError: (err) {
      onError(err);
    });
  }

  @override
  confirmPay(
      {required Map<String, dynamic> params,
      required Options option,
      required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(
            option: option,
            params: params,
            path: API.APIConfig + "order/confirm-by-user")
        .post(beforeSend: () {
      beforeSend();
    }, onSuccess: (data) {
      onSuccess(data);
    }, onError: (err) {
      onError(err);
    });
  }
}
