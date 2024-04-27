import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';
import 'lang/translation_service.dart';
import 'tools/utils.dart';

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
        useMaterial3: true,
        primarySwatch: Utils.str2MaterialColor("0274b7"),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: Colors.amber,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Utils.str2Color("fd8700"),
            foregroundColor: const Color(0xFFFFFFFF),
          ),
        ),
      ),
      // initialBinding: AllControllerBinding(),
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,
      getPages: AppPage.routes,
      unknownRoute: AppPage.nofound,

      // locale: TranslationService.locale,
      locale: const Locale('zh', 'CN'),
      fallbackLocale: TranslationService.fallbackLocal,
      translations: TranslationService(),
    );
  }
}
