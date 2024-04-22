import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MoreMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print(route);
    // return null; // 不做任何操作

    return const RouteSettings(name: "/login3", arguments: {});
  }
}
