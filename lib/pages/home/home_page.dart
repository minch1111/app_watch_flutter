// ignore: file_names
import 'package:example_flutter/pages/home/home_controller.dart';
import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:skeletons/skeletons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => HomeAppState();
}

final List<String> imgList = [
  'assets/BgSlider.png',
  'assets/BgSlider.png',
  'assets/BgSlider.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SizedBox(
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.fitHeight, width: 1000.0),
                const Positioned(
                  top: 10.0,
                  left: 10.0,
                  // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                  child: SizedBox(
                    width: 180,
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: 'ElleBaskerVille'),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: Image.asset(
                    'assets/ImgSVGSlider.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 20,
                  child: SizedBox(
                      height: 35,
                      width: 130,
                      child: ElevatedButton(
                          onPressed: (() => {}),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              const Text("Mua ngay"),
                              Flexible(
                                  child: Image.asset(
                                'assets/rightlabelSVG.png',
                                width: 50,
                                height: 50,
                              )),
                            ],
                          ))),
                )
              ],
            ),
          ),
        ))
    .toList();

class HomeAppState extends State<HomeApp> {
  final localStorge = LocalStorage('token');
  int current = 0;
  final CarouselController controller = CarouselController();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // get backgroundColor => null;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.HOME),
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
                                  id: AppConstant.HOME),
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
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      "BỘ SƯU TẬP MỚI NHẤT",
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  Obx(
                    () => CarouselSlider(
                      items: homeController.banner.value.Data != null
                          ? homeController.banner.value.Data
                              ?.map((item) => Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: SizedBox(
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset("assets/BgSlider.png",
                                              fit: BoxFit.contain,
                                              width: 1000.0),
                                          Positioned(
                                            top: 5.0,
                                            left: 10.0,
                                            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                                            child: SizedBox(
                                              width: 220,
                                              child: Text(
                                                item.ProductName.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontFamily:
                                                        'ElleBaskerVilleBold'),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 55.0,
                                            left: 10.0,
                                            child: Container(
                                                width: 250,
                                                child: Html(
                                                    data: """${item.Content}""")
                                                // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                                                // child: SizedBox(
                                                //   width: 250,
                                                //   child:
                                                //   Html(data: """${item.Content}""")
                                                //   // Text(
                                                //   //   item.Content.toString(),
                                                //   //   style: const TextStyle(
                                                //   //       color: Colors.white,
                                                //   //       fontSize: 12.0,
                                                //   //       fontFamily:
                                                //   //           'ElleBaskerVille'),
                                                //   // ),
                                                // ),
                                                ),
                                          ),
                                          Positioned(
                                              right: 10,
                                              top: 0,
                                              child: SizedBox(
                                                width: 150,
                                                child: Image.network(
                                                  item.ImageBanner.toString(),
                                                  fit: BoxFit.cover,
                                                  // width: 100,
                                                ),
                                              )),
                                          Positioned(
                                            bottom: 20,
                                            left: 20,
                                            child: SizedBox(
                                              height: 35,
                                              width: 130,
                                              child: ElevatedButton(
                                                onPressed: (() => {
                                                      Get.to(
                                                          ProductItem(
                                                            id: item.IdProduct
                                                                .toString(),
                                                          ),
                                                          id: AppConstant.HOME),
                                                    }),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.amber),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: <Widget>[
                                                    const Text("Mua ngay"),
                                                    Flexible(
                                                      child: Image.asset(
                                                        'assets/rightlabelSVG.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()
                          : [1]
                              .map((item) => Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: SizedBox(
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset("assets/BgSlider.png",
                                              fit: BoxFit.fitHeight,
                                              width: 1000.0),
                                          // const SkeletonAvatar(
                                          //   style: SkeletonAvatarStyle(
                                          //     width: 1000,
                                          //     height: double.infinity
                                          //   ),
                                          // ),
                                          Positioned(
                                            top: 10.0,
                                            left: 10.0,
                                            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                                            child: SizedBox(
                                              width: 180,
                                              child: SkeletonParagraph(
                                                style:
                                                    const SkeletonParagraphStyle(
                                                        lines: 5,
                                                        spacing: 7,
                                                        lineStyle:
                                                            SkeletonLineStyle(
                                                                height: 10,
                                                                randomLength:
                                                                    true)),
                                              ),
                                              // child: Text(
                                              //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a',
                                              //   style: TextStyle(
                                              //       color: Colors.white,
                                              //       fontSize: 12.0,
                                              //       fontFamily: 'ElleBaskerVille'),
                                              // ),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 10,
                                            top: 10,
                                            child: SkeletonAvatar(
                                                style: SkeletonAvatarStyle(
                                                    height: 130, width: 90)),
                                            // child: Image.asset(
                                            //   'assets/ImgSVGSlider.png',
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                          const Positioned(
                                            bottom: 25,
                                            left: 20,
                                            child: SkeletonAvatar(
                                              style: SkeletonAvatarStyle(
                                                  height: 35, width: 130),
                                            ),
                                            // SizedBox(
                                            //   height: 35,
                                            //   width: 130,
                                            //   child: ElevatedButton(
                                            //     onPressed: (() => {}),
                                            //     style: ElevatedButton.styleFrom(
                                            //         primary: Colors.amber),
                                            //     child: Row(
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.center,
                                            //       // ignore: prefer_const_literals_to_create_immutables
                                            //       children: <Widget>[
                                            //         const Text("Mua ngay"),
                                            //         Flexible(
                                            //           child: Image.asset(
                                            //             'assets/rightlabelSVG.png',
                                            //             width: 50,
                                            //             height: 50,
                                            //           ),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                      options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "KHUYẾN MÃI",
                          style: TextStyle(
                              fontFamily: 'MontserratBold',
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     print('DUMAAAAAA ');
                        //   },
                        //   child: const Text(
                        //     "Xem thêm",
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontFamily: "MontserratRegular"),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    height: 580,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Obx(
                      () => homeController.productDataSales.value.Data != null
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.7,
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: homeController.productDataSales.value
                                      .Data?.ListProduct?.length ??
                                  0,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // ignore: unnecessary_null_in_if_null_operators
                                    Get.to(
                                        ProductItem(
                                          id: homeController
                                              .productDataSales
                                              .value
                                              .Data!
                                              .ListProduct![index]
                                              .Id
                                              .toString(),
                                        ),
                                        id: AppConstant.HOME);
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 10.0,
                                              offset: const Offset(
                                                0.0, // Move to right 10  horizontally
                                                5.0, // Move to bottom 10 Vertically
                                              ),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Image.network(
                                              homeController
                                                  .productDataSales
                                                  .value
                                                  .Data!
                                                  .ListProduct![index]
                                                  .Thumbnail
                                                  .toString(),
                                              // "https://res.cloudinary.com/htc-watch/image/upload/v1653565024/tc06f4ce0zg9vmftboq8.jpg",
                                              height: 140,
                                              fit: BoxFit.cover,
                                            ),
                                            Center(
                                              child: Text(
                                                  '${homeController.productDataSales.value.Data!.ListProduct![index].BrandName}'),
                                            ),
                                            Center(
                                              child: Text(
                                                homeController
                                                    .productDataSales
                                                    .value
                                                    .Data!
                                                    .ListProduct![index]
                                                    .Name
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'MontserratBold',
                                                  fontSize: 17,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  homeController
                                                      .productDataSales
                                                      .value
                                                      .Data!
                                                      .ListProduct![index]
                                                      .FromPrice
                                                      .toVND(unit: 'đ'),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'MontserratBold',
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
                                          child: Image.asset(
                                              "assets/sale_1.png",
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      const Positioned(
                                        top: 15,
                                        right: 11,
                                        child: Text(
                                          "Sale",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.7,
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                              ),
                              itemCount: 4,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
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
                                  child: SkeletonItem(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SkeletonAvatar(
                                          style: SkeletonAvatarStyle(
                                              width: double.infinity,
                                              height: 180),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          child: SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                              lines: 1,
                                              spacing: 6,
                                              lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 10,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  width: 60),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: SkeletonParagraph(
                                            style: SkeletonParagraphStyle(
                                              lines: 2,
                                              spacing: 4,
                                              lineStyle: SkeletonLineStyle(
                                                  randomLength: false,
                                                  height: 10,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  width: double.infinity),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      "SẢN PHẨM BÁN CHẠY",
                      style: TextStyle(
                          fontFamily: 'MontserratBold',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  GetBuilder<HomeController>(
                    init: homeController,
                    builder: (controller) => CarouselSlider(
                      items: [1, 2, 3, 4].asMap().entries.map((e) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              // Get.to(const ProductItem(), id: AppConstant.HOME);
                            },
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
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
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/ImgSVGSlider.png',
                                    height: e.key ==
                                            homeController.curentValue.value
                                        ? 200
                                        : 140,
                                    fit: BoxFit.cover,
                                  ),
                                  Center(
                                    child: Text(
                                      'Rolex',
                                      style: TextStyle(
                                          fontSize: e.key ==
                                                  homeController
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
                                                  homeController
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
                                        bottomRight: Radius.circular(10),
                                      ),
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
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 400),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "THƯƠNG HIỆU",
                        style: TextStyle(
                            fontFamily: 'MontserratBold',
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 110,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Obx(
                      () => homeController.brandData.value.Data != null
                          ? ListView.builder(
                              itemCount:
                                  homeController.brandData.value.Data?.length ??
                                      0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: 120,
                                height: 100,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
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
                                child: Center(
                                  child: Image.network(
                                    "${homeController.brandData.value.Data![index].ImageBrand}",
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                width: 120,
                                height: 100,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
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
                                child: const SkeletonItem(
                                  child: SkeletonAvatar(
                                    style: SkeletonAvatarStyle(
                                        width: double.infinity,
                                        height: double.infinity),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
