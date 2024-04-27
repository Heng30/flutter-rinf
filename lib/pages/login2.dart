import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("登陆第二步"),
      ),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                // you will enter the third step and will jump back to the first step
                // Navigator.pushReplacementNamed(context, "/login3");
                // Navigator.pushNamed(context, "/login3");
                Get.toNamed("/login3");
              },
              child: const Text("下一步", style: TextStyle(fontSize: 25)))),
    );
  }
}
