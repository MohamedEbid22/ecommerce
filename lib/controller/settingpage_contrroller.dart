import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingPageController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.Login);
  }
}
