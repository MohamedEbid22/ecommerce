import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/orders/archivedata.dart';
import 'package:ecommercee/data/datasource/remot/orders/panding.dart';
import 'package:ecommercee/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPandingaController extends GetxController {
  Curd curd = Curd();
  OrderArchiveData orderPandingData = OrderArchiveData(Get.put(Curd()));

  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderPandingData
        .getdata(myServices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['data'];
      data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
    }
    update();
  }

  refrehOrder() {
    getData();
  }

  deleteData(String orders_id) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderPandingData.deletedata(orders_id);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      refrehOrder();
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
