import 'package:ecommercee/view/screen/faveritpage.dart';
import 'package:ecommercee/view/screen/home.dart';
import 'package:ecommercee/view/screen/offer.dart';
import 'package:ecommercee/view/screen/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int cuntpage = 0;

  List<Widget> listpage = [
    const Homepage(),
    const SettingPage(),
    const Offer(),
    const FaveritPage(),
  ];

  @override
  changepage(int i) {
    cuntpage = i;
    update();
  }
}
