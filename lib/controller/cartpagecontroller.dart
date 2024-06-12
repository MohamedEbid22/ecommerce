import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/cartdata.dart';
import 'package:ecommercee/data/model/cartmodel.dart';
import 'package:ecommercee/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  @override
  void onInit() {
    veiwdata();
    controllercoupon = TextEditingController();
    super.onInit();
  }

  TextEditingController? controllercoupon;
  CouponModel? couponModel;
  int? discountcoupon = 0;
  String? couponname;
  String? couponid;
  late int? count = couponModel?.couponCount;

  Curd curd = Curd();
  CartData cartData = CartData(Get.put(Curd()));
  List<CartModel> data = [];
  double pricetotol = 0.0;
  int totlcount = 0;

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  addcart(items_id) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.add(
        myServices.sharedPreferences.getString("id")!, items_id.toString());

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {}
    update();
  }

  removecart(items_id) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.remove(
        myServices.sharedPreferences.getString("id")!, items_id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {}
    update();
  }

  getcount(items_id) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.count(
        myServices.sharedPreferences.getString("id")!, items_id.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      String countitems = "0";
      if (response["status"] == "success") {
        countitems = response['data'].toString();
        print(countitems);
        return countitems;
      } else {}
    }
    update();
  }

  resetVarCart() {
    pricetotol = 0.0;
    totlcount = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    veiwdata();
  }

  veiwdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.veiw(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresbonse = response['datacart']['data'];
          Map dataresbonseprice = response["catdatalist"];
          data.clear();
          data.addAll(dataresbonse.map((e) => CartModel.fromJson(e)));
          pricetotol = double.parse(dataresbonseprice['subtotal'].toString());
          totlcount = int.parse(dataresbonseprice['countitemscard']);
        }
      } else {}
    }
    update();
  }

  checkout() {
    if (data.isEmpty) return Get.snackbar("look", "this car is empty");
    Get.toNamed(AppRoutes.CheckOut, arguments: {
      "couponid": couponid ?? "0",
      "priceorders": pricetotol.toString(),
      "discountcoupon": discountcoupon.toString()
    });
  }

  gettotelprice() {
    return (pricetotol - pricetotol * discountcoupon! / 100);
  }

  chickcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.chickcoupon(controllercoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel?.couponDiscount!;
        couponname = couponModel?.couponName!;
        couponid = couponModel?.couponId!.toString();
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "The coupon not corected");
      }
    }
    update();
  }
}
