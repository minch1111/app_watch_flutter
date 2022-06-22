// ignore: unused_import
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example_flutter/models/bodyOrderToPost.dart';
import 'package:example_flutter/models/dataCart.dart';
// ignore: unused_import
import 'package:example_flutter/models/orderDetail.dart';
import 'package:example_flutter/pages/cart/cart_provider.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class CartController extends GetxController {
  final curentValue = 0.obs;
  RxBool checkCart = false.obs;
  RxBool allCheck = false.obs;
  final localStorage = LocalStorage("token");
  final token = "".obs;
  final cart = DataCart.fromJson({}).obs;
  final body = BodyOrderToPost.fromJson({}).obs;
  int? lengthCart = 0;
  int total = 0;
  int totalPrice = 0;
  bool? exist;
  final checkedToPay = [];

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
              checkCart.value = false;
            } else {
              checkCart.value = true;
              cart.value = DataCart.fromJson(res);
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

//Thêm/Cập nhật giỏ hàng
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

//Xoá khỏi giỏ hàng
  updateOnlyInCart(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    final a = [];
    for (var item in cart.value.Data!.OrderDetails!.toList()) {
      a.add({
        "ClassifyProductId": "${item.ClassifyProductId}",
        "ProductName": "${item.ProductName}",
        "ClassifyProductName": "${item.ClassifyProductName}",
        "Price": item.Price,
        "Count": item.Count
      });
    }
    //Check ngược => chỉ lấy những sp k đánh dấu
    for (var item1 in cart.value.Data!.OrderDetails!.toList()) {
      for (var item2 in checkedToPay) {
        if (item2["ClassifyProductId"] == item1.ClassifyProductId.toString()) {
          a.removeWhere((element) =>
              element["ClassifyProductId"] == item2["ClassifyProductId"]);
        }
      }
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
          checkedToPay.clear();
          if (cart.value.Data!.OrderDetails!.length == checkedToPay.length) {
            deleteAllCart("${cart.value.Data!.Id}");
          }
        },
        onError: (err) {
          onError(err);
        });
  }

  updateCartAfterPay(
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    final a = [];
    for (var item in cart.value.Data!.OrderDetails!.toList()) {
      a.add({
        "ClassifyProductId": "${item.ClassifyProductId}",
        "ProductName": "${item.ProductName}",
        "ClassifyProductName": "${item.ClassifyProductName}",
        "Price": item.Price,
        "Count": item.Count
      });
    }
    //Check ngược => chỉ lấy những sp k đánh dấu
    for (var item1 in cart.value.Data!.OrderDetails!.toList()) {
      for (var item2 in checkedToPay) {
        if (item2["ClassifyProductId"] == item1.ClassifyProductId.toString()) {
          a.removeWhere((element) =>
              element["ClassifyProductId"] == item2["ClassifyProductId"]);
        }
      }
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

//Xoá khỏi array checkedToPay khi bỏ chọn
  removeToPayment(String? idClassify, String? productName, String? classifyName,
      String? image, int? count, int? price) {
    var checked;
    for (var items in checkedToPay) {
      if (items["ClassifyProductId"] == idClassify) {
        checked = items;
        print(items["ClassifyProductId"]);
        break;
      }
    }
    checkedToPay.remove(checked);
    // checkedToPay.remove({
    //   "ClassifyProductId": idClassify,
    //   "ProductName": productName,
    //   "ClassifyProductName": classifyName,
    //   "Price": price,
    //   "Image": image,
    //   "Count": count
    // });
  }

//Thêm vào array checkedToPay khi chọn
  addToPayment(String? idClassify, String? productName, String? classifyName,
      String? image, int? count, int? price) {
    //check tồn tại
    if (checkedToPay.isNotEmpty) {
      bool isExist = checkedToPay
          .any((element) => element!["ClassifyProductId"] == idClassify);
      if (isExist == true) {
      } else {
        checkedToPay.add({
          "ClassifyProductId": idClassify,
          "ProductName": productName,
          "ClassifyProductName": classifyName,
          "Price": price,
          "Image": image,
          "Count": count
        });
      }
    }
    if (checkedToPay.isEmpty) {
      checkedToPay.add({
        "ClassifyProductId": idClassify,
        "ProductName": productName,
        "ClassifyProductName": classifyName,
        "Price": price,
        "Image": image,
        "Count": count
      });
    }
  }

//Tính tổng sl và tổng tiền
  calcSumCountAndTotalPrice() {
    try {
      total = 0;
      totalPrice = 0;
      for (var item in checkedToPay) {
        int c = item["Count"] ?? 0;
        total += c;
        int p = item["Price"] ?? 0;
        totalPrice += c * p;
      }
    } catch (e) {
      print(e);
    }
  }

//Set count khi đã chọn
  updateCountWhenCheclk(id, count) {
    int index = checkedToPay
        .indexWhere((element) => element["ClassifyProductId"] == id);
    print(index);
    if (index >= 0) {
      checkedToPay[index]["Count"] = count;
    }
  }

//Xoá khỉ giỏ hàng == 0
  deleteAllCart(
    String id,
  ) {
    CartProvider().deleteAllCart(
        id: id,
        option: Options(headers: {
          "Content-Type": "Application/json",
          "Authorization": "Bearer $token"
        }),
        beforeSend: () {},
        onSuccess: (res) {
          print(res);
        },
        onError: (e) {
          print(e);
        });
  }

//Xác nhận thanh toán
  confirmPay(String provinde, String district, String ward, String address,
      bool isPayment,
      {required Function() beforeSend,
      required Function(dynamic data) onSuccess,
      required Function(dynamic error) onError}) {
    final a = [];
    for (var item in checkedToPay) {
      a.add({
        "ClassifyProductId": "${item["ClassifyProductId"]}",
        "ProductName": "${item["ProductName"]}",
        "ClassifyProductName": "${item["ClassifyProductName"]}",
        "Price": item["Price"],
        "Count": item["Count"]
      });
    }
    CartProvider().confirmPay(
        params: {
          "OrderDetails": a,
          "Id": "${cart.value.Data!.Id}",
          "VoucherId": "",
          "Description": "",
          "Ship": 15000,
          "AddressReceive": {
            "Province": provinde,
            "District": district,
            "Ward": ward,
            "Address": address
          },
          "PhoneReceive": "0968087127",
          "IsPayment": isPayment
        },
        option: Options(headers: {
          "Content-Type": "Application/json",
          "Authorization": "Bearer $token"
        }),
        beforeSend: () {
          beforeSend();
        },
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (err) {
          onError(err);
        });
  }

//Chọn tất cả

  allCheckAction() {
    allCheck.value = true;
    checkedToPay.clear();
    for (var item in cart.value.Data!.OrderDetails!.toList()) {
      checkedToPay.add({
        "ClassifyProductId": "${item.ClassifyProductId}",
        "ProductName": "${item.ProductName}",
        "ClassifyProductName": "${item.ClassifyProductName}",
        "Image": "${item.Image}",
        "Price": item.Price,
        "Count": item.Count
      });
    }
  }

  cancelAllCheckAction() {
    allCheck.value = false;
    checkedToPay.clear();
  }
}
