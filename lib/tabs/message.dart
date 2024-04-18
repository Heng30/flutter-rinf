import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Widget> _tabItems() {
    return [
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white10,
        child: Column(children: [
          TabBar(controller: _tabController, tabs: const [
            Tab(child: Text("关注")),
            Tab(child: Text("热门")),
            Tab(child: Text("视频"))
          ]),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: _tabItems(),
            ),
          )
        ]));
  }
}
