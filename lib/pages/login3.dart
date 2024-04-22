import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../tabs.dart';

class Login3 extends StatefulWidget {
  const Login3({super.key});

  @override
  State<Login3> createState() => _Login3State();
}

class _Login3State extends State<Login3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("登陆第三步"),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushAndRemoveUntil(context,
            //     MaterialPageRoute(builder: (BuildContext context) {
            //   return const Tabs(title: "Flutter", index: 2);
            // }), (route) => false);
            Get.offAll(const Tabs(title: "Flutter", index: 2));
          },
          child: const Text("完成", style: TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}
