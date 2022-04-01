// import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  //hiển thị thông báo
  pressLogin() {
    final strUsername = username.text;
    final strPassword = password.text;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
             title: const Text("Thông báo"),
            content: Text('Username: $strUsername password $strPassword'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("My App")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset('asset/Logo.png'),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text('LOGIN INFORMATION',
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Username",
                    suffixIcon: Icon(Icons.account_circle)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: Icon(Icons.lock_clock_rounded)),
              ),
            ),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                pressLogin();
              },
            ),
            Container(
              child: const Text('facebook.com'),

            )
          ],
        ),
      ),
    );
  }
}
