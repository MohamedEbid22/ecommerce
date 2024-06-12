import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  gotopage();
  forgettext();
}

class LoginControllerImp extends LoginController {
  MyServices myServices = Get.find();
  var email;
  var password;
  StatusRequest? statusRequest = StatusRequest.none;
  Curd curd = Curd();
  LoginData sigupData = LoginData(Get.put(Curd()));
  List data = [];

  GlobalKey<FormState> loginkey = new GlobalKey<FormState>();
  bool display = true;

  @override
  gotopage() {
    Get.offNamed(AppRoutes.SignUp);
  }

  @override
  login() async {
    var formdata = loginkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("Valid");
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await sigupData.PostData(email.toString(), password.toString());
      statusRequest = handlingData(response);
      print(password);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          myServices.sharedPreferences
              .setString("id", response["data"]["user_id"].toString());
          String userid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("user_name", response["data"]["user_name"]);
          myServices.sharedPreferences
              .setString("user_email", response["data"]["user_email"]);
          myServices.sharedPreferences
              .setString("user_phone", response["data"]["user_phone"]);
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");

          myServices.sharedPreferences.setString("stap", "2");
          Get.offNamed(AppRoutes.Homepage);
        } else {
          Get.defaultDialog(
              title: "Worning", middleText: "Phone Number Or Email no ");
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  changedisplaypasswoed() {
    display = display == false ? true : false;

    update();
  }

  @override
  forgettext() {
    Get.toNamed(AppRoutes.Forget);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });

    super.onInit();
  }
}
