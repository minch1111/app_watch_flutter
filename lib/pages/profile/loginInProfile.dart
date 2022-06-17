// ignore_for_file: file_names

import 'package:example_flutter/pages/dashboard/dashboard_controller.dart';
import 'package:example_flutter/pages/profile/profileController.dart';
import 'package:example_flutter/pages/profile/signUpInProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

import '../auth/LoginController.dart';

class LoginInProfile extends StatefulWidget {
  const LoginInProfile({Key? key}) : super(key: key);

  @override
  State<LoginInProfile> createState() => _LoginInProfileState();
}

class _LoginInProfileState extends State<LoginInProfile> {
  final profileController = Get.put(ProfileController());
  final dashboardController = Get.put(DashboardController());
  final storage = LocalStorage('token');
  final loginController = LoginController();
  bool isLoading = true;
  bool isHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Đăng nhập"),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                onPressed: () => {
                  Get.back(),
                  // Get.to(const NotifyListPage(), id: AppConstant.HOME),
                },
                icon: Image.asset('assets/logoOfficial.png',
                    fit: BoxFit.fitHeight),
              ),
            ],
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/LoginBg.png"), fit: BoxFit.cover),
          ),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/logoOfficial.png',
                        fit: BoxFit.fitHeight),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratBold',
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                    child: const Text(
                      "Tên tài khoản",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratRegular',
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      controller: loginController.account,
                      // keyboardType: TextInputType.multiline,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        labelText: "",
                        hintText: "Nhập tài khoản",
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 4,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                    child: const Text(
                      "Mật khẩu",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratRegular',
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      obscureText: isHidePassword,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(color: Colors.white),
                      controller: loginController.password,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 4,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: "Nhập mật khẩu",
                        hintStyle: const TextStyle(color: Colors.white),
                        labelText: "",
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isHidePassword = !isHidePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 255, 216, 97),
                                  Color.fromARGB(255, 255, 191, 0),
                                  Color.fromARGB(255, 209, 159, 6)
                                  //add more colors
                                ]),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              // shadowColor: Colors.transparent,
                              //make color or elevated button transparent
                            ),
                            onPressed: () async {
                              storage.clear();
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (loginController.account.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập tài khoản',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red);
                              } else if (loginController
                                  .password.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập mật khẩu',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.red);
                              } else {
                                loginController.loginAction(
                                  loginController.account.text,
                                  loginController.password.text,
                                  beforeSend: () => {
                                    EasyLoading.show(
                                      maskType: EasyLoadingMaskType.black,
                                    ),
                                  },
                                  onSuccess: (data) => {
                                    EasyLoading.dismiss(),
                                    storage.setItem(
                                        'token', data.Data?.AccessToken),
                                    profileController.token =
                                        data.Data!.AccessToken.toString(),
                                    Get.back(result: "Ok"),
                                    Future.delayed(
                                      const Duration(microseconds: 400),
                                      () {
                                        profileController.loadInfoUser(
                                            beforeSend: () {},
                                            onSuccess: (res) {
                                              profileController.infoUser.value =
                                                  res;
                                            },
                                            onError: (err) {
                                              print("looix $err");
                                            });
                                        // Get.back(); // Prints after 1 second.
                                      },
                                    ),
                                    Get.snackbar(
                                      "",
                                      "",
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      titleText: const Text(
                                        "Đăng nhập thành công",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      colorText: Colors.white,
                                      backgroundColor: Colors.green.shade400,
                                    ),
                                  },
                                  onError: (err) => {
                                    EasyLoading.dismiss(),
                                    Get.snackbar('Error', err,
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red)
                                  },
                                );
                                print(
                                    "tài khoản ${loginController.account.text}, mật khẩu ${loginController.password.text} ");
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 18,
                                bottom: 18,
                              ),
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                    fontFamily: 'MontserratBold', fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: const Text(
                        "Đâng ký tài khoản",
                        style: TextStyle(
                            fontFamily: "MontserratRegular",
                            color: Colors.amber),
                      ),
                      onPressed: () {
                        Get.to(
                          const SignUpInProfile(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
