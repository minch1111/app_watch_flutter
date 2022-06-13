// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:example_flutter/pages/dashboard/dashboard_page.dart';
import 'package:example_flutter/pages/product/product_item_controller.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatefulWidget {
  final id;
  const ProductItem({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isLoading = true;
  int current = 0;
  late int numberCart = 1;
  late int currentPrice = 0;
  late int currentStock = 0;
  final productItemController = Get.put(ProductItemController());
  final carouselController1 = CarouselController();
  final carouselController2 = CarouselController();
  final oCcy = NumberFormat("###.0#", "en_US");
  @override
  void initState() {
    productItemController.loadDetailProduct(
      widget.id,
      beforeSend: () {},
      onSuccess: (data) {
        productItemController.productDetail.value = data.Data!;
        setState(() {
          isLoading = false;
        });
      },
      onError: (e) {
        print(e);
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // productItemController.loadDetailProduct(id, beforeSend: beforeSend, onSuccess: onSuccess, onError: onError)
    return isLoading
        ? const LoadingPagge()
        : Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 300,
                        child: GetBuilder<ProductItemController>(
                          init: productItemController,
                          builder: (controller) => CarouselSlider(
                            carouselController: carouselController1,
                            items: productItemController
                                        .productDetail.value.ClassifyProducts !=
                                    null
                                ? productItemController
                                    .productDetail.value.ClassifyProducts!
                                    .asMap()
                                    .entries
                                    .map((e) {
                                    return (Image.network(
                                        productItemController
                                            .productDetail
                                            .value
                                            .ClassifyProducts![e.key]
                                            .Image
                                            .toString(),
                                        height: 150,
                                        fit: BoxFit.contain));
                                  }).toList()
                                : [1].asMap().entries.map((e) {
                                    return (Image.asset(
                                        "assets/ImgSVGSlider.png",
                                        height: 150,
                                        fit: BoxFit.contain));
                                  }).toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  controller.curentValue.value = index;
                                });
                                // print(index);
                              },
                              initialPage: controller.curentValue.value,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              height: double.infinity,
                              enableInfiniteScroll: true,
                              autoPlay: false,
                            ),
                          ),
                        ),
                      ),
                      GetBuilder<ProductItemController>(
                        init: productItemController,
                        builder: (controller) => Container(
                          width: 200,
                          // height: 300,
                          // color: Colors.amber,
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
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
                              Text(
                                controller.productDetail.value.Name.toString(),
                                style: const TextStyle(
                                    fontFamily: 'MontserratExtraBold',
                                    fontSize: 30),
                              ),
                              Text(
                                currentPrice == 0
                                    ? (controller.productDetail.value
                                                    .FromPrice !=
                                                null &&
                                            controller.productDetail.value
                                                    .ToPrice !=
                                                null
                                        ? controller
                                                .productDetail.value.FromPrice
                                                .toVND(unit: 'đ') +
                                            " - " +
                                            controller
                                                .productDetail.value.ToPrice
                                                .toVND(unit: 'đ')
                                        : "")
                                    : currentPrice.toVND(unit: 'đ'),
                                style: const TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 17),
                              ),
                              Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  const Text(
                                    "Số lượng",
                                    style: TextStyle(
                                        fontFamily: 'MontserratBold',
                                        fontSize: 17),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        right: 1, left: 2),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {
                                        if (numberCart < currentStock) {
                                          setState(() {
                                            numberCart = numberCart + 1;
                                          });
                                        }
                                      },
                                      child:
                                          const Center(child: Icon(Icons.add)),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 30,
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      numberCart.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18),
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
                                      onPressed: () {
                                        setState(() {
                                          if (numberCart > 0) {
                                            numberCart = numberCart - 1;
                                          }
                                        });
                                      },
                                      child: const Center(
                                          child: Icon(Icons.remove)),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "Loại sản phẩm",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 17),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: controller.productDetail.value
                                            .ClassifyProducts !=
                                        null
                                    ? controller
                                        .productDetail.value.ClassifyProducts!
                                        .asMap()
                                        .entries
                                        .map((e) {
                                        // print(e);
                                        return (GestureDetector(
                                          onTap: () {
                                            carouselController1
                                                .animateToPage(e.key);
                                            setState(() {
                                              controller.curentValue.value =
                                                  e.key;
                                              currentStock = e.value.Stock!;
                                              currentPrice =
                                                  e.value.OriginalPrice!;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            decoration: BoxDecoration(
                                                border: (controller.curentValue
                                                            .value ==
                                                        e.key)
                                                    ? Border.all(
                                                        width: 1,
                                                        color: Colors.black)
                                                    : null),
                                            width: 30,
                                            height: 30,
                                            child: Image.network(
                                              e.value.Image.toString(),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ));
                                      }).toList()
                                    : [1].asMap().entries.map((e) {
                                        // print(e);
                                        return (GestureDetector(
                                          onTap: () {
                                            // setState(() {
                                            //   productItemController.curentValue.value = e.key;
                                            // });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 8),
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                              "assets/ImgSVGSlider.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ));
                                      }).toList(),
                              ),
                              Container(
                                // height: 90,
                                // color: Colors.black,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  onPressed: () => {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => const AlertDialog(
                                              title: Text("Alert Dialog Box"),
                                              content: Text(
                                                  "You have raised a Alert Dialog Box"),
                                              actions: <Widget>[],
                                            ))
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      fixedSize:
                                          const Size(double.infinity, 60)),
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
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Column(children: [
                        const Text(
                          "Giới thiệu",
                          style: TextStyle(
                              fontFamily: 'MontserratBold', fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                              productItemController
                                          .productDetail.value.BrandName !=
                                      null
                                  ? productItemController
                                      .productDetail.value.BrandName
                                      .toString()
                                  : "",
                              style: const TextStyle(
                                  fontFamily: 'Colophones',
                                  fontSize: 110,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Text(
                          productItemController
                                      .productDetail.value.Description !=
                                  null
                              ? productItemController
                                  .productDetail.value.Description
                                  .toString()
                              : "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'ElleBaskerVille', fontSize: 20),
                        )
                      ]),
                    ),
                  ),
                  GetBuilder<ProductItemController>(
                    init: productItemController,
                    builder: (controller) => CarouselSlider(
                      carouselController: carouselController2,
                      items: [1, 2, 3, 4].asMap().entries.map((e) {
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              // Get.to(ProductItem());
                            },
                            child: Container(
                              height: 230,
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
                                            productItemController
                                                .curentValue2.value
                                        ? 140
                                        : 140,
                                    fit: BoxFit.contain,
                                  ),
                                  Center(
                                    child: Text(
                                      'Rolex',
                                      style: TextStyle(
                                          fontSize: e.key ==
                                                  productItemController
                                                      .curentValue2.value
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
                                                      .curentValue2.value
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
                          productItemController.curentValue2.value = index;
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
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
  }
}

class LoadingPagge extends StatelessWidget {
  const LoadingPagge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitCircle(
          size: 140,
          itemBuilder: (context, index) {
            final colors = [
              Colors.amber,
              Colors.red,
              Colors.blue,
              Colors.deepPurple
            ];
            final color = colors[index % colors.length];
            return DecoratedBox(
              decoration:
                  BoxDecoration(color: color, shape: BoxShape.rectangle),
            );
          },
        ),
      ),
    );
  }
}
