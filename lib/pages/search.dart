import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search(this.keyword, {super.key});

  final String keyword;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Row(
            children: [
              Text("搜索"),
            ],
          )),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Text("你的搜索关键字为：${widget.keyword}",
              style: const TextStyle(fontSize: 25))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.home)),
    );
  }
}
