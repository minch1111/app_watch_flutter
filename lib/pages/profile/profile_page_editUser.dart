import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Cập nhật thông tin cá nhân",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        // onTap: ,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 0,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Image.asset('assets/ava_demo.png', fit: BoxFit.cover),
              ),
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
                    color: Colors.black,
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
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    fillColor: Colors.white30,
                    filled: true,
                    labelText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.amber),
                    ),
                  ),
                )),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            //   child: const Text(
            //     'Mật khẩu',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontFamily: 'MontserratRegular',
            //         fontSize: 18),
            //   ),
            // ),
            // Container(
            //     margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //     child: const TextField(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide(width: 3, color: Colors.black)),
            //         fillColor: Colors.white30,
            //         filled: true,
            //         labelText: "",
            //         focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(
            //             width: 4,
            //             color: Colors.amber
            //           ),
            //         ),
            //       ),
            //     )),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                'Email',
                style: TextStyle(
                    color: Colors.black,
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
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    fillColor: Colors.white30,
                    filled: true,
                    labelText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 4, color: Colors.amber),
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                'Số điện thoại',
                style: TextStyle(
                    color: Colors.black,
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
                      borderSide: BorderSide(width: 3, color: Colors.black)),
                  fillColor: Colors.white30,
                  filled: true,
                  labelText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.amber),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                'Địa chỉ',
                style: TextStyle(
                    // color: Colors.white,
                    color: Colors.black,
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
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    fillColor: Colors.white30,
                    filled: true,
                    labelText: "",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.amber),
                    ),
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
                          "Cập nhật",
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
      ),
    );
  }
}
