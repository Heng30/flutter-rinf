// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // use ios navigation effects
import '../pages/news.dart';
import '../pages/login1.dart';
import '../pages/login2.dart';
import '../pages/login3.dart';

Map routes = {
  "/news": (context, {arguments}) => News(arguments: arguments),
  "/login1": (context) => const Login1(),
  "/login2": (context) => const Login2(),
  "/login3": (context) => const Login3(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // final Route route = MaterialPageRoute(
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
