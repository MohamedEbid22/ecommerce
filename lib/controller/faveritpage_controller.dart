import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/faveritpage_data.dart';
import 'package:ecommercee/data/model/faveritmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FaveritPageController extends SearchMixController {
  Curd curd = Curd();
  FavertPageData favertPageData = FavertPageData(Get.put(Curd()));

  List<FaveritModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favertPageData
        .getdata(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['data'];
      data.addAll(responsedata.map((e) => FaveritModel.fromJson(e)));
    }
    update();
  }

  deletdata(String favorite_id) {
    var response = favertPageData.deletdata(favorite_id.toString());
    data.removeWhere(
        (element) => element.favoriteId.toString() == favorite_id.toString());

    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
