import 'package:example_flutter/pages/profile/profile_page_editUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum SingingCharacter { COD, VNP }

class _PaymentPageState extends State<PaymentPage> {
  SingingCharacter? _character = SingingCharacter.COD;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Thanh Toán",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      offset: const Offset(
                        0.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Địa chỉ",
                              style: TextStyle(
                                  fontFamily: "MontserratBold", fontSize: 18),
                            ),
                            Icon(Icons.location_on),
                          ],
                        ),
                        const Text(
                          "Nguyễn Hữu Trí",
                          style: TextStyle(
                              fontFamily: "MontserratBold", fontSize: 18),
                        ),
                        const Text("90 Sư Vạn Hạnh, Quận 10, TP.HCM")
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      child: IconButton(
                        onPressed: () {
                          Get.to(const ProfileEditPage());
                        },
                        icon: const Icon(Icons.edit_location_alt),
                        iconSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10.0,
                                  offset: const Offset(
                                    0.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: double.infinity,
                                  width: 120,
                                  child: Image.asset('assets/Account-info.png',
                                      fit: BoxFit.cover),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Rolex Omage III",
                                        style: TextStyle(
                                            fontFamily: "MontserratBold",
                                            fontSize: 20),
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "Giá: ",
                                            style: TextStyle(
                                              fontFamily: "MontserratBold",
                                            ),
                                          ),
                                          Text("3.000.000 đ")
                                        ],
                                      ),
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: <Widget>[
                                          const Text(
                                            "Số lượng",
                                            style: TextStyle(
                                                fontFamily: 'MontserratBold',
                                                fontSize: 17),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin: const EdgeInsets.only(
                                                right: 1, left: 2),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.black,
                                                  padding:
                                                      const EdgeInsets.all(0)),
                                              onPressed: () {},
                                              child: const Center(
                                                  child: Icon(Icons.add)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                // enabledBorder: OutlineInputBorder(
                                                //   borderSide: BorderSide(
                                                //       width: 0, color: Colors.black),
                                                // ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin:
                                                const EdgeInsets.only(left: 1),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.black,
                                                  padding:
                                                      const EdgeInsets.all(0)),
                                              onPressed: () {},
                                              child: const Center(
                                                  child: Icon(Icons.remove)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 15,
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  print("object");
                                },
                                child: const Text(
                                  "Xoá",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                width: double.infinity,
                height: 1.5,
                color: const Color.fromARGB(106, 158, 158, 158),
                margin: const EdgeInsets.symmetric(vertical: 30),
              ),
              const Text(
                "Phương thức thanh toán",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "MontserratBold",
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.5,
                color: const Color.fromARGB(255, 0, 0, 0),
                margin: const EdgeInsets.symmetric(horizontal: 130),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(right: 150),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(155, 255, 193, 7),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16))),
                        child: const Text(
                          "Tiền mặt",
                          style: TextStyle(
                              fontFamily: "MontserratBold", fontSize: 18),
                        ),
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: Colors.amber,
                        value: SingingCharacter.COD,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Container(
                        height: 40,
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(right: 150),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(155, 255, 193, 7),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16))),
                        child: const Text(
                          "VN PAY",
                          style: TextStyle(
                              fontFamily: "MontserratBold", fontSize: 18),
                        ),
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: Colors.amber,
                        value: SingingCharacter.VNP,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.5,
                color: const Color.fromARGB(106, 158, 158, 158),
                margin: const EdgeInsets.symmetric(vertical: 30),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Phí vận chuyển : 15.000đ",
                      style:
                          TextStyle(fontFamily: "MontserratBold", fontSize: 18),
                    ),
                    Row(
                      children: const [
                        Text("Số lượng sản phẩm :",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 18)),
                        Text("10",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 18)),
                      ],
                    ),
                    Row(
                      children: const [
                        Text("Tổng hoá đơn : ",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 18)),
                        Text("12.000.000đ",
                            style: TextStyle(
                                fontFamily: "MontserratBold", fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 40,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {},
                  child: const Text(
                    "Thanh toán",
                    style: TextStyle(
                        fontFamily: "ElleBaskerVilleBold", fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
