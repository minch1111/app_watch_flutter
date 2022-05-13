import 'package:example_flutter/pages/profile/profile_page_orderedDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderedListPage extends StatefulWidget {
  const OrderedListPage({Key? key}) : super(key: key);

  @override
  State<OrderedListPage> createState() => _OrderedListPageState();
}

class _OrderedListPageState extends State<OrderedListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Lịch sử mua hàng",
          style: TextStyle(color: Colors.black),
        ),
        // automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
          child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 3,
        itemBuilder: ((context, index) => GestureDetector(
              onTap: () {
                Get.to(const OrderedDetail());
              },
              child: Container(
                height: 130,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
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
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: 120,
                      child: Image.asset('assets/Account-info.png',
                          fit: BoxFit.cover),
                    ),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Rolex Omega III",
                            style: TextStyle(fontFamily: "MontserratBold"),
                          ),
                          Row(
                            children: const [
                              Text("Số lượng : "),
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "MontserratBold",
                                    fontSize: 15),
                              )
                            ],
                          ),
                          // Row(
                          //   children: const [
                          //     Text("Thành tiền : "),
                          //     Text(
                          //       "3.000.000 đ",
                          //       style: TextStyle(
                          //           color: Colors.black,
                          //           fontFamily: "MontserratBold",
                          //           fontSize: 15),
                          //     )
                          //   ],
                          // ),
                          Row(
                            children: const [
                              Text("Trạng thái : "),
                              Text(
                                "Đã giao hàng",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: "MontserratBold",
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )),
      )),
    );
  }
}
