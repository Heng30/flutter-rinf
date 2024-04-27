// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // use ios navigation effects
import 'package:get/get.dart'; // use ios navigation effects
import '../tabs.dart';
import '../pages/more.dart';
import '../pages/search2.dart';
import '../pages/news.dart';
import '../pages/login1.dart';
import '../pages/login2.dart';
import '../pages/login3.dart';
import "../pages/hero.dart";
import "../pages/hero2.dart";
import "../pages/hero3.dart";
import "../pages/nofound.dart";
import "../middlewares/more.dart";

// used for Get route function
class AppPage {
  static final nofound = GetPage(
    name: "/nofound",
    page: () => const NoFound(),
  );

  static final routes = [
    GetPage(
      name: "/",
      page: () => const Tabs(title: 'Flutter'),
    ),
    GetPage(
      name: "/search2",
      page: () => const Search2(),
    ),
    GetPage(
      name: "/more",
      page: () => const More(),
      middlewares: [
        MoreMiddleWare(),
      ],
    ),
    GetPage(
      name: "/news",
      page: () => const News(arguments: {}),
    ),
    GetPage(
      name: "/login1",
      page: () => const Login1(),
    ),
    GetPage(
      name: "/login2",
      page: () => const Login2(),
    ),
    GetPage(
      name: "/login3",
      page: () => const Login3(),
    ),
    GetPage(
      name: "/hero",
      page: () => const MyHero(
        arguments: {},
      ),
    ),
    GetPage(
      name: "/hero2",
      page: () => const MyHero2(
        arguments: {},
      ),
    ),
    GetPage(
      name: "/hero3",
      page: () => const MyHero3(
        arguments: {},
      ),
    ),
  ];
}

// used for flutter default route function
Map routes = {
  "/news": (context, {arguments}) => News(arguments: arguments),
  "/login1": (context) => const Login1(),
  "/login2": (context) => const Login2(),
  "/login3": (context) => const Login3(),
  "/hero": (context, {arguments}) => MyHero(arguments: arguments),
  "/hero2": (context, {arguments}) => MyHero2(arguments: arguments),
  "/hero3": (context, {arguments}) => MyHero3(arguments: arguments),
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
