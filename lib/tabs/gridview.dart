import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView(this.count, {super.key, this.height = 200});

  final int count;
  final double height;

  List<Widget> _initData() {
    var l = <Widget>[];
    for (var i = 0; i < count; i++) {
      l.add(GridTile(
          header: Text('头部 - $i',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blueAccent,
              )),
          footer: Text('尾部 - $i',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.pink,
              )),
          child: Container(
            // decoration: BoxDecoration(color: Colors.red),
            alignment: Alignment.center,
            child: const Icon(Icons.dock),
          )));
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.extent(
        maxCrossAxisExtent: 120,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 20,
        crossAxisSpacing: 4,
        childAspectRatio: 0.9,
        children: _initData(),
      ),
    );
  }
}

class MyGridView2 extends StatelessWidget {
  const MyGridView2(this.count, {super.key, this.height = 200});

  final int count;
  final double height;

  Widget _item(context, index) {
    return GridTile(
        header: Padding(
            padding: const EdgeInsets.all(2),
            child: Text('头部 - $index',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blueAccent,
                ))),
        footer: Padding(
            padding: const EdgeInsets.all(2),
            child: Text('尾部 - $index',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.pink,
                ))),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.dock),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: 20,
          crossAxisSpacing: 4,
          childAspectRatio: 0.9,
        ),
        itemBuilder: _item,
      ),
    );
  }
}
