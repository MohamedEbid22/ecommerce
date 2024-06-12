import 'package:ecommercee/controller/onboarding_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ContinueBottonOnboarding extends GetView<OnBoardingControllerIMP> {
  const ContinueBottonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          margin: EdgeInsets.only(top: 10),
          child: MaterialButton(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {
              controller.next();
            },
            color: colorApp.orange,
            child: const Text(
              "Continue",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            controller.skiping();
          },
          child: const Text(
            "Skip",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
