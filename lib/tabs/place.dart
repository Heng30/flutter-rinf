import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  final List<String> _items = ["第一条数据", "第二条数据"];
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();

  Widget _buildItem(index) {
    return ListTile(
      title: Text(_items[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // due to remove animation, user can tap on the same item multiple times
          if (index >= _items.length) {
            return;
          }

          var item = _buildItem(index);
          _items.removeAt(index);
          _globalKey.currentState!.removeItem(
            index,
            (context, animation) {
              return ScaleTransition(
                scale: animation,
                child: item,
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _items.add("新数据${_items.length + 1}");
          _globalKey.currentState!.insertItem(_items.length - 1);
        },
      ),
      body: AnimatedList(
        key: _globalKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: _buildItem(index),
          );
        },
      ),
    );
  }
}
