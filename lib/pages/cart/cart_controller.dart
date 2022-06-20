import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example_flutter/models/bodyOrderToPost.dart';
import 'package:example_flutter/models/dataCart.dart';
import 'package:example_flutter/models/orderDetail.dart';
import 'package:example_flutter/pages/cart/cart_provider.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class CartController extends GetxController {
  final curentValue = 0.obs;
  bool checkCart = false;
  final localStorage = LocalStorage("token");
  final token = "".obs;
  final cart = DataCart.fromJson({}).obs;
  final body = BodyOrderToPost.fromJson({}).obs;
  int? lengthCart = 0;
  bool? exist ;

  List<BodyOrderToPost> listBody = [];

  @override
  void onInit() {
    token.value = localStorage.getItem("token") ?? "";

    print("token in cart " + token.toString());

    if (token.toString().isEmpty == false) {
      loadCart(
          beforeSend: () {},
          onSuccess: (res) {
            // cart.value = res;
            print(res['Data']);
            if (res['Data'] == null) {
              print("run null");
            } else {
              print("run ok");
              checkCart = true;
              cart.value = DataCart.fromJson(res);
              print(cart.value.Data?.OrderDetails?.length);
              lengthCart = cart.value.Data?.OrderDetails?.length;
            }
            // Map valueMp =jsonDecode(res);
            // print(valueMp);
          },
          onError: (err) {
            print("loi cart $err");
          });
    }
    super.onInit();
  }

  createUpdateCart(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    //check giỏ hàng đã có sp hay chưa
    final a = [];
    //giỏ hàng đã có sp
    if (lengthCart! > 0) {
      for (var i = 0; i < lengthCart!; i++) {
        print("exist cart");
        a.add({
          "ClassifyProductId":
              "${cart.value.Data?.OrderDetails![i].ClassifyProductId}",
          "ProductName": "${cart.value.Data?.OrderDetails![i].ProductName}",
          "ClassifyProductName":
              "${cart.value.Data?.OrderDetails![i].ClassifyProductName}",
          "Price": cart.value.Data?.OrderDetails![i].Price,
          "Count": cart.value.Data?.OrderDetails![i].Count
        });
      }
      a.add({
        "ClassifyProductId": "${body.value.ClassifyProductId}",
        "ProductName": "${body.value.ProductName}",
        "ClassifyProductName": "${body.value.ClassifyProductName}",
        "Price": body.value.Price,
        "Count": body.value.Count
      });
      print("done Exist");
    }
    if (lengthCart! == 0) {
      a.add({
        "ClassifyProductId": "${body.value.ClassifyProductId}",
        "ProductName": "${body.value.ProductName}",
        "ClassifyProductName": "${body.value.ClassifyProductName}",
        "Price": body.value.Price,
        "Count": body.value.Count
      });
    }
    CartProvider().createUpdateCart(
        params: {
          "OrderDetails": a,
        },
        option: Options(headers: {
          "Content-Type": "Application/json",
          "Authorization": "Bearer ${token.toString()}"
        }),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (res) {
          onSuccess(res);
        },
        onError: (err) {
          onError(err);
        });
  }

  loadCart(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    CartProvider().getCart(
        option: Options(headers: {
          "Content-Type": "Application/json",
          "Authorization": "Bearer $token"
        }),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (res) {
          onSuccess(res);
        },
        onError: (err) {
          onError(err);
        });
  }
}
