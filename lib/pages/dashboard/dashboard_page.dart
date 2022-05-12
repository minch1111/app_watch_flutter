import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:example_flutter/pages/blog/blog_page.dart';
import 'package:example_flutter/pages/cart/cart_page.dart';
import 'package:example_flutter/pages/home/home_page.dart';
import 'package:example_flutter/pages/product/product_item.dart';
// import 'package:example_flutter/pages/nothing/nothing.dart';
// import 'package:example_flutter/pages/product/product_item.dart';
import 'package:example_flutter/pages/product/product_page.dart';
import 'package:example_flutter/pages/profile/profile_page.dart';
// import 'package:example_flutter/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.put(DashboardController());

  DashboardPage({Key? key}) : super(key: key);

  Widget _buildTitle() {
    return Obx(
      () => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: 70,
            color: Colors.transparent,
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffBBBBBB),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: CustomNavigationBar(
                iconSize: 25,
                isFloating: true,
                selectedColor: const Color(0xff040307),
                strokeColor: const Color(0x30040307),
                opacity: 1,
                elevation: 0,
                backgroundColor: Colors.transparent,
                items: [
                  CustomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                      color: controller.tabIndex.value == 0
                          ? Colors.black
                          : Colors.grey,
                    ),
                    // icon: Image.asset(
                    //   'assets/icons/icon_tab_home.png',
                    //   width: 25,
                    //   height: 25,
                    //   color: controller.tabIndex.value == 0
                    //       ? Colors.black
                    //       : const Color(0xffBBBBBB),
                    // ),
                  ),
                  CustomNavigationBarItem(
                    icon: Icon(
                      Icons.watch_sharp,
                      size: 25,
                      color: controller.tabIndex.value == 1
                          ? Colors.black
                          : Colors.grey,
                    ),
                    // icon: Image.asset(
                    //   'assets/icons/icon_tab_shoes.png',
                    //   width: 24,
                    //   height: 24,
                    //   color: controller.tabIndex.value == 1
                    //       ? Colors.black
                    //       : const Color(0xffBBBBBB),
                    // ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/cart.png',
                      width: 25,
                      height: 25,
                      color: controller.tabIndex.value == 2
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/news_2.png',
                      width: 27,
                      height: 27,
                      color: controller.tabIndex.value == 3
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Image.asset(
                      'assets/user.png',
                      width: 25,
                      height: 25,
                      color: controller.tabIndex.value == 4
                          ? Colors.black
                          : const Color(0xffBBBBBB),
                    ),
                    // icon: Image.asset(
                    //   'assets/icons/icon_tab_profile.png',
                    //   width: 24,
                    //   height: 24,
                    //   color: controller.tabIndex.value == 4
                    //       ? Colors.black
                    //       : const Color(0xffBBBBBB),
                    // ),
                  ),
                ],
                currentIndex: controller.tabIndex.value,
                onTap: (index) {
                  controller.tabIndex.value = index;
                },
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Visibility(
                    visible: controller.tabIndex.value == 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.black,
                      ),
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      alignment: Alignment.bottomCenter,
                      height: 3,
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: controller.tabIndex.value == 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      alignment: Alignment.topCenter,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: controller.tabIndex.value == 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      alignment: Alignment.topCenter,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: controller.tabIndex.value == 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      alignment: Alignment.bottomCenter,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: controller.tabIndex.value == 4,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      alignment: Alignment.bottomCenter,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            child: SizedBox(
              height: 70,
              width: 70,
              child: SizedBox(
                  child: ElevatedButton(
                child: Center(child: Image.asset("assets/cart.png",fit: BoxFit.cover,)),
                onPressed: () {
                  Get.to(const CartPage());
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(24),
                    primary: Colors.amber),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: const [
              HomeApp(),
              ProductPage(),
              CartPage(),
              BlogPage(),
              ProfilePage(),
              // ProductItem(),
            ],
          ),
        ),
        bottomNavigationBar: _buildTitle(),
      ),
    );
  }
}
