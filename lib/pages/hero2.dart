import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:get/get.dart';

class MyHero2 extends StatefulWidget {
  const MyHero2({super.key, required this.arguments});

  final Map arguments;

  @override
  State<MyHero2> createState() => _MyHero2State();
}

class _MyHero2State extends State<MyHero2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: PhotoView(
                imageProvider: NetworkImage(
                  // widget.arguments["src"],
                  Get.arguments["src"],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
