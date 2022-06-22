// ignore_for_file: unnecessary_const

import 'package:example_flutter/pages/cart/cart_controller.dart';
import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/payment/payment_page.dart';
import 'package:example_flutter/pages/profile/profileController.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
// import 'package:localstorage/localstorage.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, id}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool value = false;
  bool change = false;
  final cartController = Get.put(CartController());
  String? x;
  // final profileConller = Get.put(ProfileController());

  @override
  void initState() {
    // if (profileConller.token.isEmpty == false) {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Data in page ${cartController.cart.value.Data}");

    return Navigator(
      key: Get.nestedKey(AppConstant.CART),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 244, 244, 244),
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.black54,
              centerTitle: false,
              titleSpacing: 0.0,
              title: Transform(
                transform: Matrix4.translationValues(6.0, 0.0, 0.0),
                child: Image.asset('assets/logoOfficialDark.png',
                    fit: BoxFit.fitHeight),
              ),
              actions: <Widget>[
                Stack(
                  children: <Widget>[
                    IconButton(
                        onPressed: () => {
                              Get.to(const NotifyListPage(),
                                  id: AppConstant.CART),
                            },
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 35,
                        )),
                    Positioned(
                      top: 6.0,
                      right: 1.0,
                      child: Stack(
                        children: const <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0,
                              color: Color.fromARGB(255, 242, 24, 24)),
                          Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  "10",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: Obx(
                      () => cartController.token.isEmpty == false
                          ?
                          //Nếu có token
                          (
                              //Check data có value hay k
                              cartController.checkCart.value != false
                                  ? ListView.builder(
                                      itemCount: cartController.cart.value.Data
                                          ?.OrderDetails?.length,
                                      itemBuilder: ((context, index) =>
                                              CartItem(index: index)
                                          // Container(
                                          //       width: double.infinity,
                                          //       height: 100,
                                          //       margin: const EdgeInsets.all(10),
                                          //       // padding: const EdgeInsets.symmetric(vertical: 10),
                                          //       decoration: const BoxDecoration(
                                          //         // color: Colors.amber,
                                          //         borderRadius: BorderRadius.all(
                                          //           Radius.circular(30),
                                          //         ),
                                          //       ),
                                          //       child: Row(
                                          //         children: [
                                          //           Checkbox(
                                          //               checkColor: Colors.white,
                                          //               activeColor: Colors.amber,
                                          //               shape: const RoundedRectangleBorder(
                                          //                 borderRadius: BorderRadius.all(
                                          //                   Radius.circular(10.0),
                                          //                 ),
                                          //               ),
                                          //               // shape: OutlinedBorder(side: ),
                                          //               // side: BorderSide(color: Colors.amber,),
                                          //               value: value,
                                          //               onChanged: (bool? newValue) => {
                                          //                     setState(() {
                                          //                       value = newValue!;
                                          //                     }),
                                          //                   }),
                                          //           Container(
                                          //             height: double.infinity,
                                          //             width: 320,
                                          //             decoration: BoxDecoration(
                                          //               color: Colors.white,
                                          //               borderRadius:
                                          //                   const BorderRadius.all(
                                          //                 Radius.circular(20),
                                          //               ),
                                          //               boxShadow: [
                                          //                 BoxShadow(
                                          //                   color: Colors.black
                                          //                       .withOpacity(0.2),
                                          //                   blurRadius: 10.0,
                                          //                   offset: const Offset(
                                          //                     0.0, // Move to right 10  horizontally
                                          //                     5.0, // Move to bottom 10 Vertically
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //             child: Row(
                                          //               // mainAxisAlignment: MainAxisAlignment.center,
                                          //               crossAxisAlignment:
                                          //                   CrossAxisAlignment.center,
                                          //               children: [
                                          //                 Container(
                                          //                   padding:
                                          //                       const EdgeInsets.symmetric(
                                          //                           horizontal: 10),
                                          //                   child: Image.asset(
                                          //                     'assets/ImgSVGSlider.png',
                                          //                     height: double.infinity,
                                          //                     fit: BoxFit.cover,
                                          //                   ),
                                          //                 ),
                                          //                 Container(
                                          //                   margin: const EdgeInsets.only(
                                          //                       left: 15),
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment.start,
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment.center,
                                          //                     children: [
                                          //                       const Text(
                                          //                         "Rolex",
                                          //                         style: TextStyle(
                                          //                             fontFamily:
                                          //                                 'MontserratExtraBold',
                                          //                             fontSize: 20),
                                          //                       ),
                                          //                       const Text(
                                          //                         "Price : 1.200.000",
                                          //                         style: TextStyle(
                                          //                             fontSize: 15,
                                          //                             fontFamily:
                                          //                                 'MontserratBold'),
                                          //                       ),
                                          //                       Row(
                                          //                         children: <Widget>[
                                          //                           const Text(
                                          //                             "Số lượng",
                                          //                             style: TextStyle(
                                          //                                 fontFamily:
                                          //                                     'MontserratBold',
                                          //                                 fontSize: 17),
                                          //                           ),
                                          //                           Container(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             margin:
                                          //                                 const EdgeInsets
                                          //                                         .only(
                                          //                                     right: 1,
                                          //                                     left: 2),
                                          //                             child: ElevatedButton(
                                          //                               style: ElevatedButton.styleFrom(
                                          //                                   primary: Colors
                                          //                                       .black,
                                          //                                   padding:
                                          //                                       const EdgeInsets
                                          //                                           .all(0)),
                                          //                               onPressed: () {},
                                          //                               child: const Center(
                                          //                                   child: Icon(
                                          //                                       Icons.add)),
                                          //                             ),
                                          //                           ),
                                          //                           const SizedBox(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             child: TextField(
                                          //                               textAlign: TextAlign
                                          //                                   .center,
                                          //                               keyboardType:
                                          //                                   TextInputType
                                          //                                       .number,
                                          //                               decoration:
                                          //                                   InputDecoration(
                                          //                                 border:
                                          //                                     InputBorder
                                          //                                         .none,
                                          //                                 // enabledBorder: OutlineInputBorder(
                                          //                                 //   borderSide: BorderSide(
                                          //                                 //       width: 0, color: Colors.black),
                                          //                                 // ),
                                          //                               ),
                                          //                             ),
                                          //                           ),
                                          //                           Container(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             margin:
                                          //                                 const EdgeInsets
                                          //                                         .only(
                                          //                                     left: 1),
                                          //                             child: ElevatedButton(
                                          //                               style: ElevatedButton.styleFrom(
                                          //                                   primary: Colors
                                          //                                       .black,
                                          //                                   padding:
                                          //                                       const EdgeInsets
                                          //                                           .all(0)),
                                          //                               onPressed: () {},
                                          //                               child: const Center(
                                          //                                   child: Icon(Icons
                                          //                                       .remove)),
                                          //                             ),
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     )
                                          ),
                                    )
                                  : ListView.builder(
                                      itemCount: 0,
                                      itemBuilder: ((context, index) =>
                                              CartItem(index: index)
                                          // Container(
                                          //       width: double.infinity,
                                          //       height: 100,
                                          //       margin: const EdgeInsets.all(10),
                                          //       // padding: const EdgeInsets.symmetric(vertical: 10),
                                          //       decoration: const BoxDecoration(
                                          //         // color: Colors.amber,
                                          //         borderRadius: BorderRadius.all(
                                          //           Radius.circular(30),
                                          //         ),
                                          //       ),
                                          //       child: Row(
                                          //         children: [
                                          //           Checkbox(
                                          //               checkColor: Colors.white,
                                          //               activeColor: Colors.amber,
                                          //               shape: const RoundedRectangleBorder(
                                          //                 borderRadius: BorderRadius.all(
                                          //                   Radius.circular(10.0),
                                          //                 ),
                                          //               ),
                                          //               // shape: OutlinedBorder(side: ),
                                          //               // side: BorderSide(color: Colors.amber,),
                                          //               value: value,
                                          //               onChanged: (bool? newValue) => {
                                          //                     setState(() {
                                          //                       value = newValue!;
                                          //                     }),
                                          //                   }),
                                          //           Container(
                                          //             height: double.infinity,
                                          //             width: 320,
                                          //             decoration: BoxDecoration(
                                          //               color: Colors.white,
                                          //               borderRadius:
                                          //                   const BorderRadius.all(
                                          //                 Radius.circular(20),
                                          //               ),
                                          //               boxShadow: [
                                          //                 BoxShadow(
                                          //                   color: Colors.black
                                          //                       .withOpacity(0.2),
                                          //                   blurRadius: 10.0,
                                          //                   offset: const Offset(
                                          //                     0.0, // Move to right 10  horizontally
                                          //                     5.0, // Move to bottom 10 Vertically
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //             child: Row(
                                          //               // mainAxisAlignment: MainAxisAlignment.center,
                                          //               crossAxisAlignment:
                                          //                   CrossAxisAlignment.center,
                                          //               children: [
                                          //                 Container(
                                          //                   padding:
                                          //                       const EdgeInsets.symmetric(
                                          //                           horizontal: 10),
                                          //                   child: Image.asset(
                                          //                     'assets/ImgSVGSlider.png',
                                          //                     height: double.infinity,
                                          //                     fit: BoxFit.cover,
                                          //                   ),
                                          //                 ),
                                          //                 Container(
                                          //                   margin: const EdgeInsets.only(
                                          //                       left: 15),
                                          //                   child: Column(
                                          //                     crossAxisAlignment:
                                          //                         CrossAxisAlignment.start,
                                          //                     mainAxisAlignment:
                                          //                         MainAxisAlignment.center,
                                          //                     children: [
                                          //                       const Text(
                                          //                         "Rolex",
                                          //                         style: TextStyle(
                                          //                             fontFamily:
                                          //                                 'MontserratExtraBold',
                                          //                             fontSize: 20),
                                          //                       ),
                                          //                       const Text(
                                          //                         "Price : 1.200.000",
                                          //                         style: TextStyle(
                                          //                             fontSize: 15,
                                          //                             fontFamily:
                                          //                                 'MontserratBold'),
                                          //                       ),
                                          //                       Row(
                                          //                         children: <Widget>[
                                          //                           const Text(
                                          //                             "Số lượng",
                                          //                             style: TextStyle(
                                          //                                 fontFamily:
                                          //                                     'MontserratBold',
                                          //                                 fontSize: 17),
                                          //                           ),
                                          //                           Container(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             margin:
                                          //                                 const EdgeInsets
                                          //                                         .only(
                                          //                                     right: 1,
                                          //                                     left: 2),
                                          //                             child: ElevatedButton(
                                          //                               style: ElevatedButton.styleFrom(
                                          //                                   primary: Colors
                                          //                                       .black,
                                          //                                   padding:
                                          //                                       const EdgeInsets
                                          //                                           .all(0)),
                                          //                               onPressed: () {},
                                          //                               child: const Center(
                                          //                                   child: Icon(
                                          //                                       Icons.add)),
                                          //                             ),
                                          //                           ),
                                          //                           const SizedBox(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             child: TextField(
                                          //                               textAlign: TextAlign
                                          //                                   .center,
                                          //                               keyboardType:
                                          //                                   TextInputType
                                          //                                       .number,
                                          //                               decoration:
                                          //                                   InputDecoration(
                                          //                                 border:
                                          //                                     InputBorder
                                          //                                         .none,
                                          //                                 // enabledBorder: OutlineInputBorder(
                                          //                                 //   borderSide: BorderSide(
                                          //                                 //       width: 0, color: Colors.black),
                                          //                                 // ),
                                          //                               ),
                                          //                             ),
                                          //                           ),
                                          //                           Container(
                                          //                             width: 30,
                                          //                             height: 30,
                                          //                             margin:
                                          //                                 const EdgeInsets
                                          //                                         .only(
                                          //                                     left: 1),
                                          //                             child: ElevatedButton(
                                          //                               style: ElevatedButton.styleFrom(
                                          //                                   primary: Colors
                                          //                                       .black,
                                          //                                   padding:
                                          //                                       const EdgeInsets
                                          //                                           .all(0)),
                                          //                               onPressed: () {},
                                          //                               child: const Center(
                                          //                                   child: Icon(Icons
                                          //                                       .remove)),
                                          //                             ),
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     )
                                          ),
                                    ))
                          :
                          //nếu k có token
                          ListView.builder(
                              itemCount: 0,
                              itemBuilder: ((context, index) =>
                                      CartItem(index: index)
                                  // Container(
                                  //       width: double.infinity,
                                  //       height: 100,
                                  //       margin: const EdgeInsets.all(10),
                                  //       // padding: const EdgeInsets.symmetric(vertical: 10),
                                  //       decoration: const BoxDecoration(
                                  //         // color: Colors.amber,
                                  //         borderRadius: BorderRadius.all(
                                  //           Radius.circular(30),
                                  //         ),
                                  //       ),
                                  //       child: Row(
                                  //         children: [
                                  //           Checkbox(
                                  //               checkColor: Colors.white,
                                  //               activeColor: Colors.amber,
                                  //               shape: const RoundedRectangleBorder(
                                  //                 borderRadius: BorderRadius.all(
                                  //                   Radius.circular(10.0),
                                  //                 ),
                                  //               ),
                                  //               // shape: OutlinedBorder(side: ),
                                  //               // side: BorderSide(color: Colors.amber,),
                                  //               value: value,
                                  //               onChanged: (bool? newValue) => {
                                  //                     setState(() {
                                  //                       value = newValue!;
                                  //                     }),
                                  //                   }),
                                  //           Container(
                                  //             height: double.infinity,
                                  //             width: 320,
                                  //             decoration: BoxDecoration(
                                  //               color: Colors.white,
                                  //               borderRadius:
                                  //                   const BorderRadius.all(
                                  //                 Radius.circular(20),
                                  //               ),
                                  //               boxShadow: [
                                  //                 BoxShadow(
                                  //                   color: Colors.black
                                  //                       .withOpacity(0.2),
                                  //                   blurRadius: 10.0,
                                  //                   offset: const Offset(
                                  //                     0.0, // Move to right 10  horizontally
                                  //                     5.0, // Move to bottom 10 Vertically
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //             child: Row(
                                  //               // mainAxisAlignment: MainAxisAlignment.center,
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.center,
                                  //               children: [
                                  //                 Container(
                                  //                   padding:
                                  //                       const EdgeInsets.symmetric(
                                  //                           horizontal: 10),
                                  //                   child: Image.asset(
                                  //                     'assets/ImgSVGSlider.png',
                                  //                     height: double.infinity,
                                  //                     fit: BoxFit.cover,
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   margin: const EdgeInsets.only(
                                  //                       left: 15),
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment.start,
                                  //                     mainAxisAlignment:
                                  //                         MainAxisAlignment.center,
                                  //                     children: [
                                  //                       const Text(
                                  //                         "Rolex",
                                  //                         style: TextStyle(
                                  //                             fontFamily:
                                  //                                 'MontserratExtraBold',
                                  //                             fontSize: 20),
                                  //                       ),
                                  //                       const Text(
                                  //                         "Price : 1.200.000",
                                  //                         style: TextStyle(
                                  //                             fontSize: 15,
                                  //                             fontFamily:
                                  //                                 'MontserratBold'),
                                  //                       ),
                                  //                       Row(
                                  //                         children: <Widget>[
                                  //                           const Text(
                                  //                             "Số lượng",
                                  //                             style: TextStyle(
                                  //                                 fontFamily:
                                  //                                     'MontserratBold',
                                  //                                 fontSize: 17),
                                  //                           ),
                                  //                           Container(
                                  //                             width: 30,
                                  //                             height: 30,
                                  //                             margin:
                                  //                                 const EdgeInsets
                                  //                                         .only(
                                  //                                     right: 1,
                                  //                                     left: 2),
                                  //                             child: ElevatedButton(
                                  //                               style: ElevatedButton.styleFrom(
                                  //                                   primary: Colors
                                  //                                       .black,
                                  //                                   padding:
                                  //                                       const EdgeInsets
                                  //                                           .all(0)),
                                  //                               onPressed: () {},
                                  //                               child: const Center(
                                  //                                   child: Icon(
                                  //                                       Icons.add)),
                                  //                             ),
                                  //                           ),
                                  //                           const SizedBox(
                                  //                             width: 30,
                                  //                             height: 30,
                                  //                             child: TextField(
                                  //                               textAlign: TextAlign
                                  //                                   .center,
                                  //                               keyboardType:
                                  //                                   TextInputType
                                  //                                       .number,
                                  //                               decoration:
                                  //                                   InputDecoration(
                                  //                                 border:
                                  //                                     InputBorder
                                  //                                         .none,
                                  //                                 // enabledBorder: OutlineInputBorder(
                                  //                                 //   borderSide: BorderSide(
                                  //                                 //       width: 0, color: Colors.black),
                                  //                                 // ),
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                           Container(
                                  //                             width: 30,
                                  //                             height: 30,
                                  //                             margin:
                                  //                                 const EdgeInsets
                                  //                                         .only(
                                  //                                     left: 1),
                                  //                             child: ElevatedButton(
                                  //                               style: ElevatedButton.styleFrom(
                                  //                                   primary: Colors
                                  //                                       .black,
                                  //                                   padding:
                                  //                                       const EdgeInsets
                                  //                                           .all(0)),
                                  //                               onPressed: () {},
                                  //                               child: const Center(
                                  //                                   child: Icon(Icons
                                  //                                       .remove)),
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     )
                                  ),
                            ),
                    )),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 12.0,
                          offset: const Offset(
                            -5.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        ),
                      ],
                    ),
                    child: Obx(
                      () => Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (cartController.cart.value.Data != null) {
                                if (cartController.allCheck.value == false) {
                                  cartController.allCheckAction();
                                } else {
                                  cartController.cancelAllCheckAction();
                                }
                              }
                            },
                            child: cartController.allCheck.value == false
                                ? const Text(
                                    "Chọn tất cả",
                                    style: TextStyle(color: Colors.black),
                                  )
                                : const Text(
                                    "Bỏ Chọn",
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                          Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (cartController.token.isEmpty == false &&
                                    cartController.checkedToPay.isNotEmpty) {
                                  cartController.calcSumCountAndTotalPrice();
                                  x = await Get.to(const PaymentPage());
                                  setState(() {});
                                } else {
                                  if (cartController.token.isEmpty) {
                                    showDialog(
                                        context: context,
                                        builder: (_) => const AlertDialog(
                                              title: Text(
                                                "Thông báo",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              content: Text(
                                                "Bạn chưa đăng nhập",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ));
                                  }
                                  if (cartController.checkedToPay.isEmpty) {
                                    Get.snackbar("Thông báo",
                                        "Bạn chưa chọn sản phẩm nào",
                                        backgroundColor: Colors.amber,
                                        duration: const Duration(seconds: 1));
                                  }
                                }
                              },
                              child: const Text("Thanh toán"),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (cartController.token.isNotEmpty &&
                                  cartController.checkedToPay.isNotEmpty) {
                                cartController.updateOnlyInCart(beforeSend: () {
                                  EasyLoading.show(
                                    maskType: EasyLoadingMaskType.black,
                                  );
                                }, onSuccess: (res) {
                                  EasyLoading.dismiss();
                                  Get.snackbar("Thành công",
                                      "Đã xoá sản phẩm khỏi giỏ hàng",
                                      backgroundColor: Colors.green);

                                  cartController.onInit();
                                }, onError: (err) {
                                  EasyLoading.dismiss();
                                  print(err);
                                });
                              }
                            },
                            child: const Text(
                              "Xoá",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final index;
  const CartItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool value = false;
  final cartController1 = Get.put(CartController());
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.amber,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                // shape: OutlinedBorder(side: ),
                // side: BorderSide(color: Colors.amber,),
                value: cartController1.allCheck.value == true ? true : value,
                onChanged: (bool? newValue) => {
                      if (cartController1.allCheck.value == true)
                        {
                          setState(() {
                            value = false;
                          }),
                          cartController1.allCheck.value = false,
                          cartController1.checkedToPay.clear(),
                        }
                      else
                        {
                          setState(
                            () {
                              value = newValue!;
                            },
                          ),
                          if (newValue == true)
                            {
                              cartController1.addToPayment(
                                  cartController1
                                      .cart
                                      .value
                                      .Data
                                      ?.OrderDetails![widget.index]
                                      .ClassifyProductId,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].ProductName,
                                  cartController1
                                      .cart
                                      .value
                                      .Data
                                      ?.OrderDetails![widget.index]
                                      .ClassifyProductName,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].Image,
                                  number,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].Price)
                            },
                          if (newValue == false)
                            {
                              cartController1.removeToPayment(
                                  cartController1
                                      .cart
                                      .value
                                      .Data
                                      ?.OrderDetails![widget.index]
                                      .ClassifyProductId,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].ProductName,
                                  cartController1
                                      .cart
                                      .value
                                      .Data
                                      ?.OrderDetails![widget.index]
                                      .ClassifyProductName,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].Image,
                                  number,
                                  cartController1.cart.value.Data
                                      ?.OrderDetails![widget.index].Price)
                            },
                        },
                    }),
            Container(
              height: double.infinity,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    offset: const Offset(
                      0.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Obx(
                () => cartController1.cart.value.Data != null
                    ? Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 7),
                            child: Image.network(
                              cartController1.cart.value.Data!
                                  .OrderDetails![widget.index].Image
                                  .toString(),
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 155,
                                    // height: 60,
                                    child: Text(
                                      "${cartController1.cart.value.Data!.OrderDetails![widget.index].ProductName} ${cartController1.cart.value.Data!.OrderDetails![widget.index].ClassifyProductName}",
                                      style: const TextStyle(
                                          fontFamily: 'MontserratExtraBold',
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                // Text(
                                //   "",
                                //   style: const TextStyle(
                                //       fontFamily: 'MontserratExtraBold',
                                //       fontSize: 15),
                                // ),
                                Text(
                                  "Giá : " +
                                      cartController1.cart.value.Data!
                                          .OrderDetails![widget.index].Price
                                          .toVND(unit: "đ"),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'MontserratBold'),
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text(
                                      "Số lượng",
                                      style: TextStyle(
                                          fontFamily: 'MontserratBold',
                                          fontSize: 17),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(
                                          right: 1, left: 2),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.amber,
                                            padding: const EdgeInsets.all(0)),
                                        onPressed: () {
                                          setState(() {
                                            number += 1;
                                          });
                                          if (value == true) {
                                            cartController1
                                                .updateCountWhenCheclk(
                                                    cartController1
                                                        .cart
                                                        .value
                                                        .Data!
                                                        .OrderDetails![
                                                            widget.index]
                                                        .ClassifyProductId,
                                                    number);
                                          }
                                        },
                                        child: const Center(
                                            child: Icon(Icons.add)),
                                      ),
                                    ),
                                    Container(
                                        width: 30,
                                        height: 30,
                                        padding: const EdgeInsets.all(5),
                                        child: Text("$number",
                                            textAlign: TextAlign.center)),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: const EdgeInsets.only(left: 1),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.amber,
                                            padding: const EdgeInsets.all(0)),
                                        onPressed: () {
                                          if (number > 0) {
                                            setState(() {
                                              number -= 1;
                                            });
                                          }
                                        },
                                        child: const Center(
                                            child: Icon(Icons.remove)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
