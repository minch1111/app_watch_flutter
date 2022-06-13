import 'package:example_flutter/pages/blog/blog_page_item.dart';
import 'package:example_flutter/pages/home/home_page.dart';
import 'package:example_flutter/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(AppConstant.BLOG),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  stretch: true,
                  expandedHeight: 250,
                  title: const Text(
                    'Sưu Tầm',
                    style: TextStyle(color: Colors.black),
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle
                    ],
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/bg_blog.png',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FutureBuilder(
                    builder: ((context, snapshot) => ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 8,
                          itemBuilder: ((context, index) => GestureDetector(
                                onTap: () {
                                  Get.to(const BlogPageItem(),id: AppConstant.BLOG);
                                },
                                child: Container(
                                  height: 130,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                        child: Image.asset(
                                            'assets/Account-info.png',
                                            fit: BoxFit.cover),
                                      ),
                                      Expanded(
                                          child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Một ngày thử sức chịu đựng của Omega ",
                                              style: TextStyle(
                                                  fontFamily: "MontserratBold"),
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
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
