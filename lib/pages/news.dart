import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key, required this.arguments});

  final Map arguments;

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Row(
            children: [
              Text("新闻"),
            ],
          )),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Text("新闻: ${widget.arguments['title']}",
              style: const TextStyle(fontSize: 25))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.home)),
    );
  }
}
