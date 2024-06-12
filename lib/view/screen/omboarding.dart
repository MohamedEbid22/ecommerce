import 'package:ecommercee/controller/onboarding_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/localization/changelocal.dart';

import 'package:ecommercee/view/widget/onbordingwidget/continuebotton.dart';
import 'package:ecommercee/view/widget/onbordingwidget/duration.dart';
import 'package:ecommercee/view/widget/onbordingwidget/onboardingviwe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class Onboarding extends GetView<LocalController> {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();

    Get.put(OnBoardingControllerIMP());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.bottomCenter,
                height: 10,
                width: double.infinity,
                color: colorApp.orange,
                child: Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(
                            MediaQuery.of(context).size.width, 120.0)),
                  ),
                )),
          ),
          Expanded(
              flex: 10,
              // هنا انا عامل صفحه وحاتت فيها كل حاجه عملها في view/widget/onboardingwidget
              child: OnBoardingView()),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // هنا انا عامل صفحه وحاتت فيها كل حاجه عملها في view/widget/onboardingwidget
                    DurationOnBoarding(),
                    SizedBox(
                      height: 5,
                    ),
                    // هنا انا عامل صفحه وحاتت فيها كل حاجه عملها في view/widget/onboardingwidget
                    ContinueBottonOnboarding()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
