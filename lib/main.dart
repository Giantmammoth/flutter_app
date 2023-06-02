import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/internationalisation/AppTranslation.dart';
import 'screens/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 157, 145, 179)),
        useMaterial3: true
      ),
      home: const Login(title: 'Login App'),
      translations: AppTranslation(),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('fr', 'FR'),
    );
  }
}

