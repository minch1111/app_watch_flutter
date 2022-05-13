// ignore_for_file: file_names

import 'package:example_flutter/LoginApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpApp extends StatefulWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  State<SignUpApp> createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/signUpBg.png'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                const SizedBox(
                  height: 0,
                ),
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset('assets/logoOfficial.png',
                        fit: BoxFit.fitHeight),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratBold',
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: const Text(
                    'Tên đăng nhập',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratRegular',
                        fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Text(
                    'Mật khẩu',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratRegular',
                        fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratRegular',
                        fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Text(
                    'Số điện thoại',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratRegular',
                        fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
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
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Text(
                    'Địa chỉ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MontserratRegular',
                        fontSize: 18),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                                width: 4, color: Color.fromARGB(255, 0, 0, 0))),
                      ),
                    )),
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
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              bottom: 15,
                            ),
                            child: Text(
                              "Đăng ký",
                              style: TextStyle(
                                  fontFamily: 'MontserratBold', fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Get.to(const LoginApp());
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                    height: 60,
                    width: 75,
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
                )))
          ],
        ),
      ),
    );
  }
}
