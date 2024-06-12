import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/address/addaddress.dart';
import 'package:ecommercee/data/datasource/remot/checkoutorders.dart';
import 'package:ecommercee/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddAddress addAddress = Get.put(AddAddress(Get.find()));
  CheckoutOrders checkoutOrders = CheckoutOrders(Get.put(Curd()));
  MyServices myServices = Get.find();
  List<AddressModel> data = [];
  String? payment;
  String? delivery;
  String? address = "0";
  late String couponid;
  late String discountcoupon;
  late String priceorders;
  getpayment(String val) {
    payment = val;
    update();
  }

  getdelivery(String val) {
    delivery = val;
    update();
  }

  getaddress(String val) {
    address = val;
    update();
  }

  getdataaddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addAddress.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  checkoutotder() async {
    if (payment == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (delivery == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    if (data.isEmpty) {
      return Get.snackbar("Error", "Please Add the address from seting");
    }
    statusRequest = StatusRequest.loading;
    Map dataorders = {
      "orders_userid": myServices.sharedPreferences.getString("id")!,
      "orders_address": address.toString(),
      "orders_type": delivery.toString(),
      "orders_pricedelivery": "10",
      "orders_price": priceorders,
      "orders_coupon": couponid,
      "discountcoupon": discountcoupon.toString(),
      "orders_payment": payment.toString(),
    };

    update();
    var response = await checkoutOrders.checkoutorder(dataorders);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.Homepage);
        Get.snackbar("Success", "The order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Place try again");
      }
    }

    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorders'];
    discountcoupon = Get.arguments['discountcoupon'].toString();
    print(priceorders);
    getdataaddress();
    super.onInit();
  }
}
