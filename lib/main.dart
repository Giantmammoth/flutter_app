import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/internationalisation/AppTranslation.dart';
import 'package:poke_app/routes/AppPage.dart';
import 'package:poke_app/routes/AppRoutes.dart';
import 'package:poke_app/screens/Home/HomePage.dart';
import 'screens/loginPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 157, 145, 179)),
        useMaterial3: true
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: FirebaseAuth.instance.currentUser == null ? AppRoutes.login : AppRoutes.home,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: const Locale('fr', 'FR'),
      fallbackLocale: const Locale('fr', 'FR'),
    );
  }
}

