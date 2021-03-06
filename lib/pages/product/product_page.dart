// import 'package:example_flutter/pages/home/home_page.dart';
import 'package:example_flutter/pages/notify/notify_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
import 'package:example_flutter/pages/product/product_page_controller.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productController = Get.put(ProductController());
  String gender = "Giới tính";
  String brand = "";
  String price = "Giá";
  int priceValue = 5;
  bool loading = true;
  bool loadingCate = true;
  bool isSearching = false;

  String idBrand = "";
  String idCate = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    productController.loadBrand(
        beforeSend: () {},
        onSuccess: (res) {
          setState(() {
            productController.brandData.value = res;
            brand = productController.brandData.value.Data![0].Id!;
            loading = false;
          });
        },
        onError: (err) {
          print("lỗi $err");
        });

    productController.loadCategory(
        beforeSend: (() {}),
        onSuccess: (res) {
          setState(() {
            productController.categoryData.value = res;
            gender = productController.categoryData.value.Data![0].Id!;
            loadingCate = false;
          });
        },
        onError: (err) {
          print("lỗi từ category $err");
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.PRODUCT),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: GestureDetector(
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
                                    Get.to(const NotifyListPage(),
                                        id: AppConstant.PRODUCT),
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
                            //Danh mục
                            Container(
                              width: isSearching ? 105 : 120,
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
                                value: gender,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                hint: const Text(
                                  "Danh mục",
                                  style: TextStyle(
                                      fontFamily: "MontserratBold",
                                      fontSize: 13),
                                ),
                                items: loadingCate == false
                                    ? productController.categoryData.value.Data
                                        ?.map((items) {
                                        return DropdownMenuItem(
                                          value: items.Id,
                                          child: Text(
                                            items.Name.toString(),
                                            style: const TextStyle(
                                                fontFamily: "MontserratBold",
                                                fontSize: 13),
                                          ),
                                        );
                                      }).toList()
                                    : ["Giới tính", "Nam", "Nữ"]
                                        .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: const TextStyle(
                                                fontFamily: "MontserratBold",
                                                fontSize: 13),
                                          ),
                                        );
                                      }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    gender = value!;
                                    idCate = value;
                                    isSearching = true;
                                  });
                                },
                              ),
                            ),
                            //thương hiệu
                            Container(
                              width: isSearching ? 116 : 140,
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
                                value: brand == "" ? "Rolex" : brand,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                hint: const Text(
                                  "Thương hiệu",
                                  style: TextStyle(
                                      fontFamily: "MontserratBold",
                                      fontSize: 12),
                                ),
                                items: loading == false
                                    ? productController.brandData.value.Data
                                        ?.map((items) {
                                        return DropdownMenuItem(
                                          value: items.Id,
                                          child: Text(
                                            items.Name.toString(),
                                            style: const TextStyle(
                                                fontFamily: "MontserratBold",
                                                fontSize: 13),
                                          ),
                                        );
                                      }).toList()
                                    : ["Rolex", "Casio"].map((items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: const TextStyle(
                                                fontFamily: "MontserratBold",
                                                fontSize: 13),
                                          ),
                                        );
                                      }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    brand = value!;
                                    idBrand = value;
                                    isSearching = true;
                                  });
                                  print(value);
                                },
                              ),
                            ),
                            //Giá
                            Container(
                              width: isSearching ? 107 : 120,
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
                                value: price,
                                isExpanded: true,
                                hint: const Text(
                                  "Giá",
                                  style: TextStyle(
                                      fontFamily: "MontserratBold",
                                      fontSize: 17),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                // value: "1",
                                items: [
                                  "Giá",
                                  "Mặc Định",
                                  "Thấp đến Cao",
                                  "Cao đên thấp",
                                  // "Khuyến mãi"
                                ].map((items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: const TextStyle(
                                          fontFamily: "MontserratBold",
                                          fontSize: 13),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    isSearching = true;
                                    switch (value) {
                                      case "Thấp đến cao":
                                        priceValue = 1;
                                        price = "Thấp đến cao";
                                        break;
                                      case "Mặc Định":
                                        priceValue = 0;
                                        price = "Mặc Định";
                                        break;
                                      case "Cao đến Thấp":
                                        priceValue = -1;
                                        price = "Cao đến Thấp";
                                        break;
                                      default:
                                        priceValue = 0;
                                        price = "Giá";
                                    }
                                  });
                                },
                              ),
                            ),
                            //Reset here
                            isSearching
                                ? SizedBox(
                                    width: 40,
                                    child: IconButton(
                                      icon: const Icon(Icons.refresh),
                                      onPressed: () {
                                        setState(() {
                                          Get.snackbar("Đã làm mới bộ lọc", "",
                                              backgroundColor:
                                                  Colors.green.shade300,
                                              colorText: Colors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              duration:
                                                  const Duration(seconds: 1));
                                          isSearching = false;
                                        });
                                      },
                                    ),
                                  )
                                : const SizedBox(
                                    width: 0,
                                  )
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
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: TextField(
                          autofocus: false,
                          controller: productController.keySearch,
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
                                print("tìm");
                                productController.filter(
                                    productController.keySearch.text,
                                    idCate,
                                    idBrand,
                                    priceValue,
                                    beforeSend: () {}, onSuccess: (data) {
                                  print(data);
                                }, onError: (err) {
                                  print(err);
                                });
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
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Obx(
                        () => productController.productData.value.Data != null
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
                                itemCount: productController.productData.value
                                        .Data?.ListProduct?.length ??
                                    0,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // ignore: unnecessary_null_in_if_null_operators
                                      Get.to(
                                          ProductItem(
                                              id: productController
                                                  .productData
                                                  .value
                                                  .Data!
                                                  .ListProduct![index]
                                                  .Id
                                                  .toString()),
                                          id: AppConstant.PRODUCT);
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
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
                                              Image.network(
                                                productController
                                                    .productData
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
                                                    '${productController.productData.value.Data!.ListProduct![index].BrandName}'),
                                              ),
                                              Center(
                                                child: Text(
                                                  productController
                                                      .productData
                                                      .value
                                                      .Data!
                                                      .ListProduct![index]
                                                      .Name
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'MontserratBold',
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    '1.200.000 đ',
                                                    style: TextStyle(
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
                                        // Positioned(
                                        //   top: 0,
                                        //   right: 10,
                                        //   child: SizedBox(
                                        //     height: 50,
                                        //     width: 30,
                                        //     // color: Colors.red,
                                        //     child: Image.asset("assets/sale_1.png",
                                        //         fit: BoxFit.cover),
                                        //   ),
                                        // ),
                                        // const Positioned(
                                        //   top: 15,
                                        //   right: 11,
                                        //   child: Text(
                                        //     "10%",
                                        //     style: TextStyle(
                                        //         color: Colors.white, fontSize: 13),
                                        //   ),
                                        // ),
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
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 10.0,
                                            offset: const Offset(
                                              0.0, // Move to right 10  horizontally
                                              5.0, // Move to bottom 10 Vertically
                                            ),
                                          )
                                        ]),
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
                                                        BorderRadius.circular(
                                                            8),
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
                                                        BorderRadius.circular(
                                                            8),
                                                    width: double.infinity),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
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
          ),
        ),
      ),
    );
  }
}
