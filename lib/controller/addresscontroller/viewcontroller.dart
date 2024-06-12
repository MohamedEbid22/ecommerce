import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/data/datasource/remot/address/addaddress.dart';
import 'package:ecommercee/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  Curd curd = Curd();
  AddAddress addAddress = AddAddress(Get.put(Curd()));
  List<AddressModel> data = [];

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
        if (data.isEmpty) {
          update();
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  deletedata(String address_id) {
    addAddress.delet(address_id.toString());
    data.removeWhere(
        (element) => element.addressId.toString() == address_id.toString());
    update();
  }

  @override
  void onInit() {
    getdataaddress();
    super.onInit();
  }
}
