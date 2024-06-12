import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/localization/changelocal.dart';
import 'package:ecommercee/view/widget/langage/custombuttomlang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changelang("ar");
                    Get.toNamed(AppRoutes.Onboarding);
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changelang("en");

                    Get.toNamed(AppRoutes.Onboarding);
                  }),
            ],
          )),
    );
  }
}
