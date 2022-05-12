// ignore_for_file: file_names

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';

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

// final List<Widget> imageProduct = imgList
//     .map((item) => Container(
//           width: 200,
//           color: Colors.black,
//           child: const Text('data'),
//         ))
//     .toList();

class HomeAppState extends State<HomeApp> {
  int current = 0;
  final CarouselController controller = CarouselController();

  get backgroundColor => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black54,
          title:
              Image.asset('assets/logoOfficialDark.png', fit: BoxFit.fitHeight),
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    onPressed: () => {},
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
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
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
                    height: 200))
          ],
        ));
  }
}
