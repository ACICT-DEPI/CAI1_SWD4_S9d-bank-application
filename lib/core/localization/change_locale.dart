import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_theme.dart';
import '../services/sevices.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServises = Get.find();
  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    appTheme = langCode == 'ar' ? arabicTheme : englishTheme;
    myServises.sharedPreferences.setString('lang', langCode);
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
    // Update the language property to reflect the change
    language = locale;
    update(); // Notify GetX to rebuild widgets
  }

  ThemeData appTheme = englishTheme;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    String? sharedPrefLang = myServises.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = Locale('ar');
      appTheme = arabicTheme;
    } else if (sharedPrefLang == 'en') {
      language = Locale('en');
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
  }
}
