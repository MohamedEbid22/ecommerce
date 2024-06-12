import 'package:ecommercee/controller/cartpagecontroller.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsControler extends GetxController {}

class ProductDetailsControlerIPM extends ProductDetailsControler {
  CartPageController cartcontroller = Get.put(CartPageController());
  late StatusRequest statusRequest;
  late ItemsModel itemsModel;
  String count = "0";
  Map myfavert = {};
  isfavert(id, val) {
    myfavert[id] = val;
    update();
  }

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    count = await cartcontroller.getcount(itemsModel.itemsId);

    StatusRequest.success == statusRequest;
    update();
  }

  add() {
    cartcontroller.addcart(itemsModel.itemsId);
    count = (int.parse(count) + 1).toString();
    update();
  }

  remove() {
    if (int.parse(count) > 0) {
      cartcontroller.removecart(itemsModel.itemsId);
      count = (int.parse(count) - 1).toString();
      update();
    }
  }

  void onInit() {
    intialData();
    super.onInit();
  }
}
