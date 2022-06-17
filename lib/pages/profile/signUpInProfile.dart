import 'package:flutter/material.dart';
import 'package:example_flutter/pages/auth/LoginApp.dart';
import 'package:example_flutter/pages/auth/SignUpController.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpInProfile extends StatefulWidget {
  const SignUpInProfile({Key? key}) : super(key: key);

  @override
  State<SignUpInProfile> createState() => _SignUpInProfileState();
}

class _SignUpInProfileState extends State<SignUpInProfile> {
  final signUpController = SignUpController();
  bool _isObscure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Đăng ký"),
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
          height: double.infinity,
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
                      height: 60,
                      width: 60,
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
                      'Họ và tên',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratRegular',
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: signUpController.fullname,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          fillColor: Colors.white30,
                          filled: true,
                          labelText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.amber,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          )),
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
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: signUpController.username,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          fillColor: Colors.white30,
                          filled: true,
                          labelText: "",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.amber,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          )),
                    ),
                  ),
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
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: _isObscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: signUpController.password,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black)),
                        fillColor: Colors.white30,
                        filled: true,
                        labelText: "",
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.amber),
                        ),
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
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
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: signUpController.email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black)),
                        fillColor: Colors.white30,
                        filled: true,
                        labelText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.amber),
                        ),
                        suffixIcon: Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: signUpController.phone,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black)),
                        fillColor: Colors.white30,
                        filled: true,
                        labelText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.amber),
                        ),
                        suffixIcon: Icon(
                          Icons.local_phone,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                    height: 45,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: signUpController.address,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.black)),
                        fillColor: Colors.white30,
                        filled: true,
                        labelText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.amber),
                        ),
                        suffixIcon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                            onPressed: () {
                              if (signUpController.fullname.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập họ và tên',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else if (signUpController
                                  .username.text.isEmpty) {
                                Get.snackbar(
                                    'Error', 'Bạn chưa nhập tên đăng nhập',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else if (signUpController
                                  .password.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập mật khẩu',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else if (signUpController.email.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập email',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else if (signUpController.phone.text.isEmpty) {
                                Get.snackbar(
                                    'Error', 'Bạn chưa nhập số điện thoại',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else if (signUpController
                                  .address.text.isEmpty) {
                                Get.snackbar('Error', 'Bạn chưa nhập địa chỉ',
                                    colorText: Colors.black,
                                    backgroundColor: Colors.amber.shade500);
                              } else {
                                signUpController.register(
                                  signUpController.fullname.text,
                                  signUpController.username.text,
                                  signUpController.password.text,
                                  signUpController.email.text,
                                  signUpController.phone.text,
                                  signUpController.address.text,
                                  beforeSend: () {
                                    EasyLoading.show(
                                      maskType: EasyLoadingMaskType.black,
                                    );
                                  },
                                  onSuccess: (data) {
                                    // Get.to(const LoginApp());
                                    EasyLoading.dismiss();
                                    Get.back();
                                    Get.snackbar(
                                      "",
                                      "",
                                      duration:
                                          const Duration(milliseconds: 500),
                                      titleText: const Text(
                                        "Đăng ký thành công",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      colorText: Colors.white,
                                      backgroundColor: Colors.green.shade400,
                                    );
                                    print(data);
                                  },
                                  onError: (err) {
                                    // print(err);
                                    EasyLoading.dismiss();
                                    Get.snackbar("Oops !", err,
                                        colorText: Colors.white,
                                        backgroundColor: Colors.red);
                                  },
                                );
                              }
                              print("tài khoản : " +
                                  signUpController.username.text +
                                  " mật khẩu :" +
                                  signUpController.password.text);
                            },
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
            ],
          ),
        ),
      ),
    );
  }
}
