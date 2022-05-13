import 'package:flutter/material.dart';

class OrderedDetail extends StatefulWidget {
  const OrderedDetail({Key? key}) : super(key: key);

  @override
  State<OrderedDetail> createState() => _OrderedDetailState();
}

class _OrderedDetailState extends State<OrderedDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Chi tiết đơn hàng",
          style: TextStyle(color: Colors.black),
        ),
        // automaticallyImplyLeading: false
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
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
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/ImgSVGSlider.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rolex Omega III",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "MontserratBold",
                              fontSize: 18),
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
                        const Text(
                          " Địa chỉ giao hàng : 90 Sư Vạn Hạnh, Quận 10, TP.HCM",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "",
                              fontSize: 15),
                        ),
                        Row(
                          children: const [
                            Text("Thành tiền : "),
                            Text(
                              "3.000.000 đ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "MontserratBold",
                                  fontSize: 15),
                            )
                          ],
                        ),
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
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
