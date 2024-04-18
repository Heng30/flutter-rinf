import 'package:flutter/material.dart';
import 'tabs/home.dart';
import 'tabs/shop.dart';
import 'tabs/place.dart';
import 'tabs/setting.dart';
import 'tabs/message.dart';
import 'tabs/centerbtn.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key, required this.title, this.index = 0});

  final int index;
  final String title;

  @override
  State<Tabs> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int _currentIndex = 0;

  final List<Widget> _pageItems = const [
    Home(),
    Shop(),
    Message(),
    Place(),
    Setting()
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // use this code will not cache the tabs
      // body: _pageItems[_currentIndex],

      // use this code can cache the tabs
      body: IndexedStack(index: _currentIndex, children: _pageItems),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: " 主页"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: " 购物"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: " 消息"),
            BottomNavigationBarItem(icon: Icon(Icons.place), label: " 地点"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: " 设置"),
          ]),
      floatingActionButton: CenterBtn(
        _currentIndex,
        onPressed: () => setState(() => _currentIndex = 2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
