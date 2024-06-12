import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/forget/checkemail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassController extends GetxController {
  chick();
  gotopage();
}

class ForgetPassControllerImp extends ForgetPassController {
  var email;

  StatusRequest? statusRequest = StatusRequest.none;
  Curd curd = Curd();
  Check_Emai_Data sigupData = Check_Emai_Data(Get.put(Curd()));
  List data = [];
  GlobalKey<FormState> forgetkey = new GlobalKey<FormState>();

  @override
  gotopage() {}

  @override
  chick() async {
    var formdata = forgetkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("Valid");
      statusRequest = StatusRequest.loading;
      update();
      var response = await sigupData.PostData(email.toString());
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoutes.VerifyCode,
              arguments: {"email": email.toString()});
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
