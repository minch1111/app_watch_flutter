import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('My App')),
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
                child: const Text(
                  'SIGN-UP INFORMATION',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'UserName',
                    suffixIcon: Icon(Icons.account_box_rounded)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock_clock_rounded)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    suffixIcon: Icon(Icons.lock_clock_rounded)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.mail)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                    suffixIcon: Icon(Icons.phone_callback)),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                child: const Text('Sign up'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
