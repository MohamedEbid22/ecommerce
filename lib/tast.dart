import 'package:ecommercee/controller/tast_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/imageasstes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Tastcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: GetBuilder<Tastcontroller>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
