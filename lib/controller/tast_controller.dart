import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/tast_data.dart';
import 'package:get/get.dart';

class Tastcontroller extends GetxController {
  Curd curd = Curd();
  TastData tastData = TastData(Get.put(Curd()));
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await tastData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
