

import 'package:get/get.dart';
import 'package:poke_app/routes/AppRoutes.dart';
import 'package:poke_app/screens/Home/HomeBinding.dart';
import 'package:poke_app/screens/Home/HomePage.dart';

import '../screens/loginPage.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.login,
      page: () =>  Login(),
      )
  ];
}