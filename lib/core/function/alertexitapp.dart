import 'dart:io';

import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle: TextStyle(),
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colorApp.orange)),
            onPressed: () {
              exit(0);
            },
            child: const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colorApp.orange)),
            onPressed: () {
              Get.back();
            },
            child: const Text("الغاء"))
      ]);
  return Future.value(true);
}
