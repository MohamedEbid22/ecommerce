import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class My_Middlware extends GetMiddleware {
  int? priority = 1;
  MyServices my = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (my.sharedPreferences.getString("stap") == "2") {
      return const RouteSettings(name: AppRoutes.Homepage);
    }
    if (my.sharedPreferences.getString("stap") == "1") {
      return const RouteSettings(name: AppRoutes.Login);
    }
  }
}
