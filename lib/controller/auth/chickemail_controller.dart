import 'package:ecommercee/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChickEmaikController extends GetxController {
  chick();
  gotopage();
}

class ChickEmaikControllerImp extends ChickEmaikController {
  late TextEditingController email;
  GlobalKey<FormState> chickemailkey = new GlobalKey<FormState>();

  @override
  gotopage() {
    Get.toNamed(AppRoutes.VerifyEmail);
  }

  @override
  chick() {
    var formdata = chickemailkey.currentState;
    if (formdata!.validate()) {
      print("Valid");
      Get.toNamed(AppRoutes.VerifyEmail);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
