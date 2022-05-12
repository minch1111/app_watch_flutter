// ignore_for_file: unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
// import 'package:example_flutter/pages/dashboard/dashboard_page.dart';
import 'package:example_flutter/pages/product/product_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int current = 0;
  final productItemController = Get.put(ProductItemController());

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TextEditingController(text: '0');
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Thông tin sản phẩm',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: GetBuilder<ProductItemController>(
                    init: productItemController,
                    builder: (controller) => CarouselSlider(
                      items: [1, 2, 3, 4].asMap().entries.map((e) {
                        return (Image.asset("assets/ImgSVGSlider.png",
                            height: 200, fit: BoxFit.cover));
                      }).toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          controller.curentValue.value = index;
                        },
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        height: 200,
                        autoPlay: false,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 400),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 190,
                  height: 300,
                  // color: Colors.amber,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                      const Text(
                        "Rolex Ex",
                        style: TextStyle(
                            fontFamily: 'MontserratExtraBold', fontSize: 30),
                      ),
                      const Text(
                        "1.200.000 đ",
                        style: TextStyle(
                            fontFamily: 'MontserratBold', fontSize: 17),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
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
                                  primary: Colors.black,
                                  padding:const EdgeInsets.all(0)),
                              onPressed: () {},
                              child: const Center(child: Icon(Icons.add)),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                            height: 30,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              )),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.only(left: 1),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {},
                              child: const Center(child: Icon(Icons.remove)),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Màu sắc",
                        style: TextStyle(
                            fontFamily: 'MontserratBold', fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [1, 2, 3].asMap().entries.map((e) {
                          // print(e);
                          return (Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            color: e.key == 1
                                ? Colors.black
                                : e.key == 2
                                    ? Colors.green
                                    : Colors.red,
                            width: 25,
                            height: 25,
                          ));
                        }).toList(),
                      ),
                      Container(
                        // height: 90,
                        // color: Colors.black,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              fixedSize: const Size(double.infinity, 60)),
                          child: const Text(
                            "Mua Ngay",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MontserratBold',
                                fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Column(children: const [
                  Text(
                    "Giới thiệu",
                    style:
                        TextStyle(fontFamily: 'MontserratBold', fontSize: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Rolex",
                        style: TextStyle(
                            fontFamily: 'Colophones',
                            fontSize: 130,
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    "hhhhhhhhhhhhhhhhhhhhh  hhhhhhhhhhhhh  hhhhhhhhhhhhhhhhhhhhhhhh",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'ElleBaskerVille', fontSize: 20),
                  )
                ]),
              ),
            ),
            GetBuilder<ProductItemController>(
              init: productItemController,
              builder: (controller) => CarouselSlider(
                items: [1, 2, 3, 4].asMap().entries.map((e) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        Get.to(const ProductItem());
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              'assets/ImgSVGSlider.png',
                              height: e.key ==
                                      productItemController.curentValue.value
                                  ? 200
                                  : 140,
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: Text(
                                'Rolex',
                                style: TextStyle(
                                    fontSize: e.key ==
                                            productItemController
                                                .curentValue.value
                                        ? 18
                                        : 14),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Rolex Decoub",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold',
                                    fontSize: e.key ==
                                            productItemController
                                                .curentValue.value
                                        ? 23
                                        : 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: const Center(
                                child: Text(
                                  '1.200.000 đ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MontserratBold',
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    controller.curentValue.value = index;
                  },
                  viewportFraction: 0.5,
                  enlargeCenterPage: true,
                  height: 330,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
