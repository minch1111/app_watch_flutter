import 'dart:math';

import 'package:example_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Giỏ Hàng",
          style: TextStyle(color: Colors.black),
        ),
        // automaticallyImplyLeading: false
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  builder: ((context, snapshot) => ListView.builder(
                        itemCount: 12,
                        itemBuilder: ((context, index) => Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Image.asset(
                                            'assets/ImgSVGSlider.png',
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Rolex",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'MontserratExtraBold',
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                "Price : 1.200.000",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'MontserratBold'),
                                              ),
                                              Text(
                                                "Số lượng : 2",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'MontserratBold'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
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
                        primary: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Thanh toán"),
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
    );
  }
}
