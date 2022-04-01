import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black54,
        title:
            Image.asset('assets/logoOfficialDark.png', fit: BoxFit.fitHeight),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 35,
                  )),
              Positioned(
                  top: 6.0,
                  right: 5.0,
                  child: Stack(
                    children: const <Widget>[
                      Icon(Icons.brightness_1,
                          size: 20.0, color: Color.fromARGB(255, 242, 24, 24)),
                      Positioned(
                          top: 3.0,
                          right: 4.0,
                          child: Center(
                            child: Text(
                              "10",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                    ],
                  )),
            ],
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "BỘ SƯU TẬP MỚI NHẤT",
                  style: TextStyle(
                      fontFamily: "MontserratBold",
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),

            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // ignore: unnecessary_new
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: const Icon(Icons.share),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text("Facebook"),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text("Instagram"),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.email),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
