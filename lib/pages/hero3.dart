import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:get/get.dart';

class MyHero3 extends StatefulWidget {
  const MyHero3({super.key, required this.arguments});

  final Map arguments;

  @override
  State<MyHero3> createState() => _MyHero3State();
}

class _MyHero3State extends State<MyHero3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: 3,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: PhotoViewGallery.builder(
              // itemCount: widget.arguments['src'].length,
              itemCount: Get.arguments['src'].length,
              pageController: PageController(initialPage: 1),
              onPageChanged: (index) {
                print(index);
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  // imageProvider: NetworkImage(widget.arguments["src"][index]),
                  imageProvider: NetworkImage(Get.arguments["src"][index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
