import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/homedata.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomeController extends SearchMixController {
  getdata();
  gotoitems(List categories, int selectedcat, String categories_id);
}

class HomeControllerIMP extends HomeController {
  TextEditingController? search;

  Curd curd = Curd();
  HomeData homeData = HomeData(Get.put(Curd()));
  List data = [];
  List categories = [];
  List items = [];
  List settinghome = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  String? username;
  @override
  void onInit() {
    search = TextEditingController();
    username = myServices.sharedPreferences.getString("user_name");
    getdata();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      categories.addAll(response['categories']['data']);
      items.addAll(response['items']['data']);
      settinghome.addAll(response['settinghome']['data']);
    }
    update();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  gotoitems(categoris, selectedcat, categories_id) {
    Get.toNamed(AppRoutes.ItemPage, arguments: {
      "categoris": categoris,
      "selectedcat": selectedcat,
      "categories_id": categories_id,
    });
  }

  PageProductDetails(ItemsModel itemsModel) {
    Get.offNamed(AppRoutes.productdetails,
        arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.put(Curd()));

  searchdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listdata.clear();
        List dataresbonseprice = response["data"];
        listdata.addAll(dataresbonseprice.map((e) => ItemsModel.fromJson(e)));
      }
      update();
    }
  }

  bool issearch = false;
  TextEditingController? search;
  chicksearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      issearch = false;
    }
    update();
  }

  iconsearch() {
    issearch = true;
    searchdata();
    update();
  }
}
