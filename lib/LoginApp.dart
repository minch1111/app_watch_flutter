// ignore_for_file: file_names

import 'package:example_flutter/SignUpApp.dart';
import 'package:example_flutter/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/LoginBg.png"), fit: BoxFit.cover)),
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
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.black)),
                          fillColor: Colors.white30,
                          filled: true,
                          labelText: "",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 4,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ),
                      )),
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
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                        fillColor: Colors.white30,
                        filled: true,
                        hintText: "Nhập mật khẩu",
                        labelText: "",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(children: [
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
                          onPressed: () {},
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
                    ]),
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
                        Get.to(const SignUpApp());
                      },
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const SplashScreen());
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
                  ))
            ],
          )),
    );
  }
}
