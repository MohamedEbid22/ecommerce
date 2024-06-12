import 'package:ecommercee/controller/onboarding_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DurationOnBoarding extends StatefulWidget {
  const DurationOnBoarding({super.key});

  @override
  State<DurationOnBoarding> createState() => _DurationOnBoardingState();
}

class _DurationOnBoardingState extends State<DurationOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerIMP>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardinglist.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 4),
                          duration: Duration(milliseconds: 200),
                          width: controller.currentpage == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: controller.currentpage != index
                                  ? colorApp.grey
                                  : colorApp.orange,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            )));
  }
}
