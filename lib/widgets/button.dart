import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
    this.icon,
    this.text, {
    super.key,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          // decoration: const BoxDecoration(color: Colors.red),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}
