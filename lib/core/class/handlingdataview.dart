import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/imageasstes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(TTmageAssets.loding))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(TTmageAssets.loding))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(TTmageAssets.loding))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(TTmageAssets.loding))
                    : widget;
  }
}

class AppImageAsset {}
