import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/offers/view.dart';
import 'package:ecommercee/data/datasource/remot/tast_data.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/data/model/offermodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OfferController extends SearchMixController {
  Curd curd = Curd();
  OfferData tastData = OfferData(Get.put(Curd()));

  List<ItemsModel> list = [];

  late StatusRequest statusRequest;

  Future<void> getData() async {
    statusRequest = StatusRequest.loading;
    var response = await tastData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<dynamic> responseData = response['data'];
        list = responseData.map((item) => ItemsModel.fromJson(item)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {"itemsmodel": itemsModel});
  }
}
