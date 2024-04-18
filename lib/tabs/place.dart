import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        color: Colors.white10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 0,
                width: 200,
                height: 200,
                child: Container(
                  color: Colors.red,
                  child: Stack(alignment: Alignment.center, children: [
                    Positioned(
                        width: 100,
                        height: 100,
                        right: 30,
                        child: Container(
                          color: Colors.pink,
                        ))
                  ]),
                )),
            Positioned(
                right: 0,
                width: 100,
                height: 100,
                child: Container(
                  color: Colors.blue,
                )),
            Positioned(
                top: 0,
                width: size.width,
                height: 100,
                child: Container(
                  color: Colors.green,
                  child: const Align(
                    child: Text("你好Flutter",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                )),
          ],
        ));
  }
}
