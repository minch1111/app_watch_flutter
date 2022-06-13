// ignore: file_names
import 'package:example_flutter/pages/home/home_controller.dart';
import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
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
  final localStorge = LocalStorage('user');
  int current = 0;
  final CarouselController controller = CarouselController();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(localStorge.getItem('token'));
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
                  CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 200)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "KHUYẾN MÃI",
                            style: TextStyle(
                                fontFamily: 'MontserratBold',
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                          TextButton(
                            onPressed: () {
                              print('DUMAAAAAA ');
                            },
                            child: const Text(
                              "Xem thêm",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "MontserratRegular"),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: 490,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {
                                // Get.to(
                                //   const ProductItem(),
                                //     id: AppConstant.HOME);
                              },
                              child: Container(
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
                              ));
                        }),
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
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 400),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("THƯƠNG HIỆU",
                          style: TextStyle(
                              fontFamily: 'MontserratBold',
                              color: Colors.black,
                              fontSize: 20)),
                    ),
                  ),
                  Container(
                    height: 110,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: 120,
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                            )
                          ],
                        ),
                        child:
                            Center(child: Image.asset("assets/TagHeuer.png")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
