import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/address/addaddress.dart';
import 'package:ecommercee/data/datasource/remot/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  GlobalKey<FormState> signupkey = new GlobalKey<FormState>();
  StatusRequest? statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  Curd curd = Curd();
  AddAddress addAddress = AddAddress(Get.put(Curd()));
  List data = [];

  var name;
  var city;
  var street;

  addbutton() async {
    var formdata = signupkey.currentState;
    if (formdata!.validate()) {
      formdata.save();

      print("Valid");
      statusRequest = StatusRequest.loading;
      update();
      var response = await addAddress.adddata(
          myServices.sharedPreferences.getString("id")!,
          name.toString(),
          city.toString(),
          street.toString());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoutes.Homepage);
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

  @override
  void onInit() {
    super.onInit();
  }
}
