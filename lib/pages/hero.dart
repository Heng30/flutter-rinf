import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  const MyHero({super.key, required this.arguments});

  final Map arguments;

  @override
  State<MyHero> createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["src"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                widget.arguments["src"],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
