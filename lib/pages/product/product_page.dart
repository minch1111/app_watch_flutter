import 'package:example_flutter/pages/home/home_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.black54,
            centerTitle: false,
            titleSpacing: 0.0,
            title: Transform(
              transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
              child: Image.asset('assets/logoOfficialDark.png',
                  fit: BoxFit.fitHeight),
            ),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(115, 255, 193, 7),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(115, 255, 193, 7),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: const Color.fromARGB(115, 255, 193, 7),
                      filled: true,
                      // hintStyle:const TextStyle(color: Colors.white),
                      // hintText: "Tìm kiếm",
                      labelStyle: const TextStyle(color: Colors.black,fontFamily: "ElleBaskerVilleBold"),
                      labelText: "Tìm kiếm",
                    ),
                  ),
                ),
                Container(
                  // height: 1000,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(const ProductItem());
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: double.infinity,
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
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/ImgSVGSlider.png',
                                    height: 140,
                                    fit: BoxFit.cover,
                                  ),
                                  const Center(
                                    child: Text('Rolex'),
                                  ),
                                  const Center(
                                    child: Text(
                                      "Rolex Decoub",
                                      style: TextStyle(
                                          fontFamily: 'MontserratBold',
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    height: 40,
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
                            Positioned(
                              top: 0,
                              right: 10,
                              child: SizedBox(
                                height: 50,
                                width: 30,
                                // color: Colors.red,
                                child: Image.asset("assets/sale_1.png",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const Positioned(
                              top: 15,
                              right: 11,
                              child: Text(
                                "10%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
