import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/forget/resute_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetePassController extends GetxController {
  chick();
  gotopage();
}

class ResetePassControllerImp extends ResetePassController {
  String? email;
  var password;
  var repassword;
  StatusRequest statusRequest = StatusRequest.none;

  Curd curd = Curd();
  resut_Data resut_data = resut_Data(Get.put(Curd()));
  List data = [];
  GlobalKey<FormState> resetpasswoedey = new GlobalKey<FormState>();
  bool display = true;

  @override
  gotopage() {
    Get.toNamed(AppRoutes.Suuccess_SignUp);
  }

  changedisplaypasswoed() {
    display = display == false ? true : false;

    update();
  }

  @override
  chick() async {
    var formdata = resetpasswoedey.currentState;

    if (formdata!.validate()) {
      formdata.save();
      if (password != repassword) {
        Get.defaultDialog(title: "Worning", middleText: "Password Not Match");
      } else {
        statusRequest = StatusRequest.loading;
        print(password.toString());
        print(repassword.toString());

        update();
        var response =
            await resut_data.PostData(email.toString(), password.toString());
        statusRequest = handlingData(response);

        if (StatusRequest.success == statusRequest) {
          if (response["status"] == "success") {
            Get.offAllNamed(AppRoutes.Suuccess_SignUp);
          } else {
            Get.defaultDialog(
                title: "Worning", middleText: "Phone Number Or Email no ");
          }
        }
      }

      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
