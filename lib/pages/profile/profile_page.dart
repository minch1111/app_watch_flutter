// import 'package:example_flutter/pages/auth/LoginApp.dart';
import 'package:example_flutter/pages/profile/loginInProfile.dart';
import 'package:example_flutter/pages/profile/profileController.dart';
import 'package:example_flutter/pages/profile/profile_page_editUser.dart';
import 'package:example_flutter/pages/profile/profile_page_orderedList.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:skeletons/skeletons.dart';
// import 'package:custom_switch/custom_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final localStorge = LocalStorage('token');
  final profileController = Get.put(ProfileController());
  String? x;
  // final result = Get.to(() => LoginInProfile());

  bool isDark = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.PROFILE),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: profileController.token.isEmpty == false
              ? Scaffold(
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
                                  color:
                                      const Color.fromARGB(255, 134, 134, 134),
                                  width: 2.0),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(60),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Obx(
                            () => profileController.infoUser.value.Data != null
                                ? Container(
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Thông tin",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'MontserratBold',
                                                    fontSize: 18),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {
                                                  Get.to(
                                                      const ProfileEditPage());
                                                },
                                                child: const Text(
                                                  "Chỉnh sửa",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'MontserratBold',
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
                                                children:  [
                                                  const Text(
                                                    "Tên :",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'MontserratBold',
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    " ${profileController.infoUser.value.Data?.FullName}",
                                                    style:const TextStyle(
                                                        fontFamily:
                                                            'ElleBaskerVille',
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children:  [
                                                  const Text(
                                                    "Điện thoại :",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'MontserratBold',
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    " ${profileController.infoUser.value.Data?.Phone}",
                                                    style:const TextStyle(
                                                        fontFamily:
                                                            'ElleBaskerVille',
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Địa chỉ :",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'MontserratBold',
                                                        fontSize: 15),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        "${profileController.infoUser.value.Data?.Location?.Address}, ${profileController.infoUser.value.Data?.Location?.Ward}, ${profileController.infoUser.value.Data?.Location?.District}, ${profileController.infoUser.value.Data?.Location?.Province}",
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'ElleBaskerVille',
                                                          fontSize: 15,
                                                        ),
                                                        maxLines: 3),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Email :",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'MontserratBold',
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    "${profileController.infoUser.value.Data?.Email}",
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            'ElleBaskerVille',
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 230,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Thông tin",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'MontserratBold',
                                                    fontSize: 18),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {
                                                  Get.to(
                                                      const ProfileEditPage());
                                                },
                                                child: const Text(
                                                  "Chỉnh sửa",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'MontserratBold',
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
                                          child: SkeletonParagraph(
                                            style: const SkeletonParagraphStyle(
                                                lines: 4, spacing: 8),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                        fontFamily: 'MontserratBold',
                                        fontSize: 18)),
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
                                        fontFamily: 'MontserratBold',
                                        fontSize: 18)),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Get.to(const OrderedListPage(),
                                        id: AppConstant.PROFILE);
                                  },
                                  child: const Text(
                                    "0 Đơn hàng",
                                    style: TextStyle(
                                        fontFamily: 'MontserratBold',
                                        fontSize: 18,
                                        color: Colors.amber),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      title: const Text(
                        "Thông tin người dùng",
                        style: TextStyle(color: Colors.black),
                      ),
                      automaticallyImplyLeading: false),
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splashScreen.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      // Vertically center the widget inside the column
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Bạn chưa đăng nhập",
                          style: TextStyle(
                              fontFamily: "ElleBaskerVille",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 70,
                          width: 200,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                x = await Get.to(const LoginInProfile());
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(150, 50),
                                  primary: Colors.amber.shade300),
                              child: const Text(
                                "ĐĂNG NHẬP",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 20),
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

class TemplateGuest extends StatefulWidget {
  const TemplateGuest({Key? key}) : super(key: key);

  @override
  State<TemplateGuest> createState() => _TemplateGuestState();
}

class _TemplateGuestState extends State<TemplateGuest> {
  String? x;

  @override
  Widget build(BuildContext context) {
    print("x in guest ${x ?? x.toString()}");
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
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splashScreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // Vertically center the widget inside the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bạn chưa đăng nhập",
              style: TextStyle(
                  fontFamily: "ElleBaskerVille",
                  color: Colors.white,
                  fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 70,
              width: 200,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    x = await Get.to(const LoginInProfile());
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      primary: Colors.amber.shade300),
                  child: const Text(
                    "ĐĂNG NHẬP",
                    style:
                        TextStyle(fontFamily: 'MontserratBold', fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
