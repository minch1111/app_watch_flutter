// ignore_for_file: unnecessary_const

import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/payment/payment_page.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, id}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
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
                      child: FutureBuilder(
                        builder: ((context, snapshot) => ListView.builder(
                              itemCount: 3,
                              itemBuilder: ((context, index) =>
                              CartItem()
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
                            )),
                      ),
                    ),
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
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12.0,
                          offset: const Offset(
                            -5.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Chọn tất cả",
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
                            onPressed: () {
                              Get.to(const PaymentPage(), id: AppConstant.CART);
                            },
                            child: const Text("Thanh toán"),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Xoá",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
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
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool value = false;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(10),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
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
              value: value,
              onChanged: (bool? newValue) => {
                    setState(() {
                      value = newValue!;
                    }),
                  }),
          Container(
            height: double.infinity,
            width: 320,
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
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/ImgSVGSlider.png',
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Rolex",
                        style: TextStyle(
                            fontFamily: 'MontserratExtraBold', fontSize: 20),
                      ),
                      const Text(
                        "Price : 1.200.000",
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'MontserratBold'),
                      ),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Số lượng",
                            style: TextStyle(
                                fontFamily: 'MontserratBold', fontSize: 17),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.only(right: 1, left: 2),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {
                                setState(() {
                                  number += 1;
                                });
                              },
                              child: const Center(child: Icon(Icons.add)),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            padding:const EdgeInsets.all(5),
                            child: Text("$number",textAlign: TextAlign.center)
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.only(left: 1),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {
                                if(number >0){
                                  number -= 1;
                                }
                              },
                              child: const Center(child: Icon(Icons.remove)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
