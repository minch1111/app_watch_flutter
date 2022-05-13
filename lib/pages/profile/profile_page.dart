import 'package:example_flutter/pages/profile/profile_page_editUser.dart';
import 'package:example_flutter/pages/profile/profile_page_orderedList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:custom_switch/custom_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Thông tin người dùng",
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Account-info.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/LoginBg.png'),
                    fit: BoxFit.cover,
                  ),
                  // color: Colors.amber,
                  border: Border.all(
                      color: const Color.fromARGB(255, 134, 134, 134),
                      width: 2.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 200,
                width: 350,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          const Text(
                            "Thông tin",
                            style: TextStyle(
                                fontFamily: 'MontserratBold', fontSize: 18),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Get.to(const ProfileEditPage());
                            },
                            child: const Text(
                              "Chỉnh sửa",
                              style: TextStyle(
                                  fontFamily: 'MontserratBold',
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Tên :",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 15),
                              ),
                              Text(" John Terry",
                                  style: TextStyle(
                                      fontFamily: 'ElleBaskerVille',
                                      fontSize: 15))
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Điện thoại :",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 15),
                              ),
                              Text(" 0909.123.456",
                                  style: TextStyle(
                                      fontFamily: 'ElleBaskerVille',
                                      fontSize: 15))
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Địa chỉ :",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 15),
                              ),
                              Text(" 90 Phố Hoàng Kiếm,Hà Nội",
                                  style: TextStyle(
                                      fontFamily: 'ElleBaskerVille',
                                      fontSize: 15))
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                "Email :",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 15),
                              ),
                              Text(" John123@email.com",
                                  style: TextStyle(
                                      fontFamily: 'ElleBaskerVille',
                                      fontSize: 15))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    const Text("Chế độ tối",
                        style: TextStyle(
                            fontFamily: 'MontserratBold', fontSize: 18)),
                    const Spacer(),
                    Switch(
                      value: isDark,
                      onChanged: (isOn) => {
                        print(isOn),
                        setState(
                          () {
                            isDark = isOn;
                          },
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    const Text("Lịch sử mua hàng",
                        style: TextStyle(
                            fontFamily: 'MontserratBold', fontSize: 18)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.to(const OrderedListPage());
                      },
                      child: const Text(
                        "0 Đơn hàng",
                        style: TextStyle(
                            fontFamily: 'MontserratBold',
                            fontSize: 18,
                            color: Colors.amber),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
