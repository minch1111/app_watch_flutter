// ignore_for_file: file_names

import 'package:example_flutter/pages/auth/LoginController.dart';
import 'package:example_flutter/pages/auth/SignUpApp.dart';
import 'package:example_flutter/pages/dashboard/dashboard_page.dart';
import 'package:example_flutter/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final storage = LocalStorage('token');
  final loginController = LoginController();
  bool isLoading = true;
  bool isHidePassword = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding :false,
      // resizeToAvoidBottomInset: true,
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
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextField(
                      controller: loginController.account,
                      keyboardType: TextInputType.multiline,
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
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                    // Get.back(),
                                    EasyLoading.dismiss(),
                                    Get.snackbar(
                                      "",
                                      "",
                                      duration:
                                          const Duration(milliseconds: 700),
                                      titleText: const Text(
                                        "Đăng nhập thành công",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      colorText: Colors.white,
                                      backgroundColor: Colors.green.shade400,
                                    ),
                                    storage.setItem(
                                        'token', data.Data?.AccessToken),
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () {
                                        Get.to(
                                            DashboardPage()); // Prints after 1 second.
                                      },
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
                                // ignore: unnecessary_null_comparison

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
                          const SignUpApp(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              MediaQuery.of(context).viewInsets.bottom == 0
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            const SplashScreen(),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                              ),
                              color: Colors.amber),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
