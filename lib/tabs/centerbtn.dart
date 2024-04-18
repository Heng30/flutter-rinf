import 'package:flutter/material.dart';

class CenterBtn extends StatelessWidget {
  const CenterBtn(
    this.currentIndex, {
    super.key,
    required this.onPressed,
  });

  final int currentIndex;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: FloatingActionButton(
          onPressed: () => onPressed(),
          shape: const CircleBorder(),
          backgroundColor: currentIndex == 2
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.inversePrimary,
          child: const Icon(Icons.add)),
    );
  }
}
