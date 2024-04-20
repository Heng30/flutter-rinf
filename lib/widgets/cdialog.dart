import 'package:flutter/material.dart';

class CDialog extends Dialog {
  const CDialog(
      {super.key, required this.title, required this.content, this.close});

  final String title;
  final String content;
  final Function()? close;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: Container(
        width: 300,
        height: 200,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title, style: const TextStyle(fontSize: 20)),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: close, child: const Icon(Icons.close)))
                  ],
                ),
                const Divider(),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(content),
                    ))
              ],
            )),
      )),
    );
  }
}
