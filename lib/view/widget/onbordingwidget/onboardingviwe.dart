import 'package:ecommercee/controller/onboarding_controller.dart';

import 'package:ecommercee/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView extends GetView<OnBoardingControllerIMP> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChange(val);
        },
        itemCount: onBoardinglist.length,
        itemBuilder: (context, i) => Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    onBoardinglist[i].image!,
                    height: Get.width / 1.1,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color.fromARGB(14, 240, 86, 47),
                    ),
                    margin: EdgeInsets.only(right: 20, left: 20, top: 30),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          onBoardinglist[i].title!,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(onBoardinglist[i].body!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
