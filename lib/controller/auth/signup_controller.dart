import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  gotopage();
}

class SignUpControllerImp extends SignUpController {
  StatusRequest? statusRequest = StatusRequest.none;
  GlobalKey<FormState> signupkey = new GlobalKey<FormState>();
  var email;
  var username;
  var phone;
  var password;
  bool display = true;
  changedisplaypasswoed() {
    display = display == false ? true : false;

    update();
  }

  Curd curd = Curd();
  SigupData sigupData = SigupData(Get.put(Curd()));
  List data = [];

  @override
  gotopage() {
    Get.offNamed(AppRoutes.Login);
  }

  @override
  signup() async {
    var formdata = signupkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print(password);
      print("Valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await sigupData.PostData(username.toString(),
          email.toString(), password.toString(), phone.toString());
      statusRequest = handlingData(response);
      print(password);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.VerifyEmail, arguments: {
            "email": email.toString(),
          });
        } else {
          Get.defaultDialog(
              title: "Worning",
              middleText: "Phone Number Or Email Already Exists");
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }
}
