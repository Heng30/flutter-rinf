import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search2 extends StatefulWidget {
  const Search2({super.key});

  @override
  State<Search2> createState() => _Search2State();
}

class _Search2State extends State<Search2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Row(
            children: [
              Text("搜索2"),
            ],
          )),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Text("你的搜索关键字为：${Get.arguments['keyword']}",
              style: const TextStyle(fontSize: 25))),
      floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.home)),
    );
  }
}
