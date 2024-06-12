import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/items_data.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  inith();
  changeitem(val, categories_id);
  getdata(String categories_id);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerIMP extends SearchMixController {
  Curd curd = Curd();
  ItemsData tastData = ItemsData(Get.put(Curd()));
  List data = [];
  late StatusRequest statusRequest;
  List categoris = [];
  int? selectedcat;
  String? categories_id;
  MyServices myServices = Get.find();
  @override
  inith() {
    search = TextEditingController();
    categoris = Get.arguments['categoris'];
    selectedcat = Get.arguments['selectedcat'];
    categories_id = Get.arguments['categories_id'];
    getdata(categories_id!);
  }

  @override
  void onInit() {
    inith();
    super.onInit();
  }

  @override
  changeitem(val, categories_id) {
    selectedcat = val;
    getdata(categories_id!.toString());
    update();
  }

  @override
  getdata(categories_id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await tastData.getData(
        categories_id, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"itemsmodel": itemsModel});
  }
}
