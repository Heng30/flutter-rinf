import 'package:flutter/material.dart';
import 'gridview.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.shop), onPressed: () {}),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("购物"),
                  ],
                ))),
        body: Container(
            color: Colors.blue,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: MyGridView2(
                30,
                height: double.infinity,
              ),
            )));
  }
}
