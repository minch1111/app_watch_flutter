import 'package:example_flutter/pages/home/home_page.dart';
import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String valued = "1";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   shadowColor: Colors.black54,
        //   centerTitle: false,
        //   titleSpacing: 0.0,
        //   title: Transform(
        //     transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
        //     child: Image.asset('assets/logoOfficialDark.png',
        //         fit: BoxFit.fitHeight),
        //   ),
        //   actions: <Widget>[
        //     Stack(
        //       children: <Widget>[
        //         IconButton(
        //           onPressed: () => {},
        //           icon: const Icon(
        //             Icons.notifications,
        //             color: Colors.black,
        //             size: 35,
        //           ),
        //         ),
        //         Positioned(
        //           top: 6.0,
        //           right: 1.0,
        //           child: Stack(
        //             children: const <Widget>[
        //               Icon(Icons.brightness_1,
        //                   size: 20.0,
        //                   color: Color.fromARGB(255, 242, 24, 24)),
        //               Positioned(
        //                 top: 3.0,
        //                 right: 4.0,
        //                 child: Center(
        //                   child: Text(
        //                     "10",
        //                     style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 11.0,
        //                         fontWeight: FontWeight.w500),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: true,
              expandedHeight: 170,
              title: Transform(
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                child: Image.asset('assets/logoOfficialDark.png',
                    fit: BoxFit.fitHeight),
              ),
              actions: <Widget>[
                Stack(
                  children: <Widget>[
                    IconButton(
                        onPressed: () => {
                              Get.to(const NotifyListPage()),
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
                        )),
                  ],
                )
              ],
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              floating: false,
              pinned: true,
              snap: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          iconSize: 35,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          hint: const Text(
                            "Giới Tính",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 13),
                          ),
                          items: ["1", "2", "3"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              valued = value!;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 140,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          iconSize: 35,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          hint: const Text(
                            "Thương hiệu",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 12),
                          ),
                          items: ["1", "2", "3"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                      Container(
                        width: 120,
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          iconSize: 35,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text(
                            "Giá",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 17),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          // value: "1",
                          items: ["1", "2", "3"].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle
                ],
                background: Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: "ElleBaskerVilleBold"),
                      labelText: "Tìm kiếm",
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("run");
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
                // background: Stack(
                //   fit: StackFit.expand,
                //   children: [
                //     Image.asset(
                //       'assets/bg_blog.png',
                //       fit: BoxFit.cover,
                //     ),
                //   ],
                // ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // height: 1000,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       height: 100,
          //       padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          //       child: const TextField(
          //         autofocus: false,
          //         decoration: InputDecoration(
          //           labelStyle: TextStyle(
          //               color: Colors.black,
          //               fontFamily: "ElleBaskerVilleBold"),
          //           labelText: "Tìm kiếm",
          //           suffixIcon: Icon(Icons.search),
          //         ),
          //       ),
          //     ),
        ),
      ),
    );
  }
}
