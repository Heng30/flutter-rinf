import 'package:flutter/material.dart';
import 'dart:math';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  static const String _backgroundUrl =
      'https://pic3.zhimg.com/v2-d1f733345b0d11ea4d1bde0e2511dbc8_720w.jpg?source=172ae18b';
  static const String _iconUrl =
      'https://tse2-mm.cn.bing.net/th/id/OIP-C.hFli75hOP5QJ9GktSc5CQwAAAA?rs=1&pid=ImgDetMain';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: min(MediaQuery.of(context).size.width * 0.8, 500),
      child: const Column(children: [
        Row(children: [
          Expanded(
              child: UserAccountsDrawerHeader(
            currentAccountPicture:
                CircleAvatar(backgroundImage: NetworkImage(_iconUrl)),
            accountName: Text("张三"),
            accountEmail: Text("zhangsan@gmail.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(_backgroundUrl), fit: BoxFit.cover),
            ),
            // onDetailsPressed: () { print("xxxx"); },
          )),
        ]),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text("个人中心"),
        ),
        SizedBox(height: 8),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.shop)),
          title: Text("购物中心"),
        )
      ]),
    );
  }
}

class UserDrawer extends StatelessWidget {
  const UserDrawer(this.iconUrl, this.backgroundUrl, {super.key});

  final String backgroundUrl;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(backgroundUrl), fit: BoxFit.cover)),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(iconUrl)),
              title: const Text("张三",
                  style: TextStyle(fontSize: 26, color: Colors.black87)),
            ),
          ],
        ));
  }
}
