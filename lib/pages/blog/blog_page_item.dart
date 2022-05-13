import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPageItem extends StatefulWidget {
  const BlogPageItem({Key? key}) : super(key: key);

  @override
  State<BlogPageItem> createState() => _BlogPageItemState();
}

class _BlogPageItemState extends State<BlogPageItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Blog Detail",
          style: TextStyle(color: Colors.black),
        ),
        // automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/bg_blog.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Blog title",
                    style:
                        TextStyle(fontFamily: 'MontserratBold', fontSize: 30),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.calendar_month),
                      Text("10:10 - 27/5/2022")
                    ],
                  ),
                ],
              ),
            ),
            Container(
              // height: 600,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a typespecimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style:
                        TextStyle(fontFamily: "ElleBaskerVille", fontSize: 20),
                  ),
                  Image.asset("assets/splashScreen.png"),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: const Text(
                  "Blog Liên Quan",
                  style: TextStyle(
                    fontFamily: "MontserratBold",
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              // width: double.infinity,
              color: const Color.fromARGB(255, 109, 109, 109),
              margin:const EdgeInsets.only(left: 80,right: 80,bottom: 30),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () {
                      Get.to(const BlogPageItem());
                    },
                    child: Container(
                      height: 130,
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
                            margin:const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Một ngày thử sức chịu đựng của Omega ",
                                  style:
                                      TextStyle(fontFamily: "MontserratBold"),
                                ),
                                Text(
                                  "It is a long established fact that a reader will be distracted by the readable content of a page It is a long established fact that a reader will be distracted by the readable content of a page It is a long established fact that a reader will be distracted by the readable content of a page",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
