

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  void changeLanguage(var language, var country) {
    var locale =Locale(language, country);
    var loc = Get.locale.toString();
    print('local: $loc');
    Get.updateLocale(locale);
  }
}