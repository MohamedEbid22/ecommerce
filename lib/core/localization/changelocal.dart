import 'package:ecommercee/core/function/fmassag.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? langage;
  MyServices myServices = Get.find();
  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      langage = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      langage = const Locale("en");
    } else {
      langage = Locale(Get.deviceLocale!.languageCode);
    }
    print("sharedPrefLang = $sharedPrefLang");
    super.onInit();
  }
}
