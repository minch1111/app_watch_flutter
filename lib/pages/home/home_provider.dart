import 'package:dio/dio.dart';
import 'package:example_flutter/models/bannerMain.dart';
import 'package:example_flutter/models/brandMain.dart';
import 'package:example_flutter/models/dataMainProductAll.dart';
import 'package:example_flutter/services/testAPI_services.dart';
import 'package:example_flutter/utils/config.dart';

abstract class HomeAPIProtocol {
  getAllBranch({
    required Options option,
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  });
  getPromtional({
    required Options option,
    required Function() beforeSend,
    required Function(DataMainProductAll data) onSuccess,
    required Function(dynamic error) onError,
  });

  getBanner({
    required Options option,
    required Function() beforeSend,
    required Function(BannerMain data) onSuccess,
    required Function(dynamic error) onError,
  });


}

class HomeProvider extends HomeAPIProtocol {
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
  getPromtional(
      {required Options option,
      required Function() beforeSend,
      required Function(DataMainProductAll data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(path: API.APIConfig + "product/promotion", option: option)
        .getAll(
            beforeSend: () => {beforeSend() },
            onSuccess: (data) {
              onSuccess(DataMainProductAll.fromJson(data));
            },
            onError: (error) => {onError(error)});
  }

@override
  getBanner(
      {required Options option,
      required Function() beforeSend,
      required Function(BannerMain data) onSuccess,
      required Function(dynamic error) onError}) {
    ApiService(path: API.APIConfig + "banner/mobile/all", option: option)
        .getAll(
            beforeSend: () => {beforeSend() },
            onSuccess: (data) {
              onSuccess(BannerMain.fromJson(data));
            },
            onError: (error) => {onError(error)});
  }
}
