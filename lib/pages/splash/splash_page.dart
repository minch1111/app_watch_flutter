import 'package:example_flutter/pages/auth/LoginApp.dart';
import 'package:example_flutter/pages/dashboard/dashboard_page.dart';
// ignore: unused_import
import 'package:example_flutter/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  final localstorage = LocalStorage("token");

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isLoading = false;
      }); // Prints after 1 second.
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splashScreen.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  const SizedBox(
                    height: 250,
                  ),
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/logoOfficial.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: const Center(
                        child: Text(
                          'XIN CHÀO !',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'MontserratBold'),
                        ),
                      )),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        localstorage.clear();
                        Get.to(DashboardPage());
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          primary: Colors.amber.shade300),
                      child: const Text(
                        "BẮT ĐẦU",
                        style: TextStyle(
                            fontFamily: 'MontserratBold', fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Bạn đã có tài khoản?",
                            style: TextStyle(
                                fontFamily: "MontserratRegular",
                                color: Colors.white)),
                        TextButton(
                          onPressed: (() {
                            Get.to(const LoginApp());
                          }),
                          child: const Text(
                            "Đăng nhập ngay",
                            style: TextStyle(
                                fontFamily: "MontserratRegular",
                                color: Colors.amber),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            // color: Colors.amber,
            child: Image.asset(
              "assets/waitingLauch.gif",
              fit: BoxFit.cover,
            ),
          )
        ]),
      ),
    );
  }
}
