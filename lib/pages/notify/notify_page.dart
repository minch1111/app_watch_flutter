import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifyListPage extends StatefulWidget {
  const NotifyListPage({Key? key}) : super(key: key);

  @override
  State<NotifyListPage> createState() => _NotifyListPageState();
}

class _NotifyListPageState extends State<NotifyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Thông báo",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: const Text("19/12/2022",style: TextStyle(fontFamily: "MontserratBold",fontSize: 17),),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 4,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        // Get.to();
                      },
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                             Text("Đặt hàng thành công",style: TextStyle(fontFamily: "MontserratBold",fontSize: 16),),
                            Text("Bạn đã đặt hàng thành công vào ngày 15/12/2021")
                          ],
                        )
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
