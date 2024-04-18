import 'package:flutter/material.dart';
import 'listview.dart';
import 'leftdrawer.dart';
import '../pages/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const Search("Flutter");
                }));
              },
            ),
            IconButton(
              icon: const Icon(Icons.newspaper),
              onPressed: () {
                Navigator.pushNamed(context, "/news",
                    arguments: {"title": "《如何使用Flutter?》"});
              },
            ),
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.pushNamed(context, "/login1");
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                Navigator.pushNamed(context, "/more");
              },
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("主页"),
        ),
        drawer: const LeftDrawer(),
        body: Container(
          color: Colors.white10,
          child: const MyListView(
            100,
            height: double.infinity,
          ),
        ));
  }
}
