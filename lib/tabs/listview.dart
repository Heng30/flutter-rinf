import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView(this.count, {super.key, this.height = 200});

  final int count;
  final double height;

  List<Widget> _initListData() {
    var l = <Widget>[];
    for (var i = 0; i < count; i++) {
      l.add(ListTile(
        leading: const Icon(Icons.home, color: Colors.blueAccent),
        title: Text('列表行数 - $i',
            style: const TextStyle(
              color: Colors.blueAccent,
            )),
        subtitle: Text(
          '其他内容 - $i',
        ),
        trailing: const Icon(Icons.room, color: Colors.red),
      ));
      l.add(const Divider());
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: ListView(
          children: _initListData(),
        ));
  }
}
