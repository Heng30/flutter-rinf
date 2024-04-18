import 'package:flutter/material.dart';
import 'tabs.dart';
import 'pages/more.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",

      // If you don't want to pass arguments, can use this routes property
      routes: {
        "/": (context) => const Tabs(title: 'Flutter'),
        "/more": (context) => const More(),
      },

      // If you want to pass arguments, can use this routes property
      onGenerateRoute: onGenerateRoute,
    );
  }
}
