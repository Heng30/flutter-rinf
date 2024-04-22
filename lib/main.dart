import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

// using get.dart to create an App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,
      getPages: AppPage.routes,
    );
  }
}

// Flutter Default App
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       initialRoute: "/",

//       // If you don't want to pass arguments, can use this routes property
//       routes: {
//         "/": (context) => const Tabs(title: 'Flutter'),
//         "/more": (context) => const More(),
//       },

//       // If you want to pass arguments, can use this routes property
//       onGenerateRoute: onGenerateRoute,
//     );
//   }
// }
