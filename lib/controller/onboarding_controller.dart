import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
}

class OnBoardingControllerIMP extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;
  MyServices my = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onBoardinglist.length - 1) {
      my.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoutes.Login);
    } else {
      pageController.animateToPage(currentpage,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentpage = index;
    print("object");
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  skiping() {
    my.sharedPreferences.setString("onboarding", "1");
    Get.offAllNamed(AppRoutes.Login);
  }
}
