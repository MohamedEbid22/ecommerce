import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/favertdata.dart';
import 'package:get/get.dart';

class FavertController extends GetxController {
  Curd curd = Curd();
  FavertData favertData = FavertData(Get.put(Curd()));
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  Map myfavert = {};
  isfavert(id, val) {
    myfavert[id] = val;
    update();
  }

  addfavert(items_id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favertData.add(
        myServices.sharedPreferences.getString("id")!, items_id.toString());

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {}
    update();
  }

  removefavert(items_id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favertData.remove(
        myServices.sharedPreferences.getString("id")!, items_id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {}
    update();
  }
}
