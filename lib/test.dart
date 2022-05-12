import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.amber,
                child: const Icon(Icons.arrow_back),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
