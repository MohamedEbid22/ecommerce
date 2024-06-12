import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/forget/veri_password_data.dart';
import 'package:get/get.dart';

abstract class VerifycodeController extends GetxController {
  chick();
  gotopage(String verifycode);
}

class VerifycodeControllerImp extends VerifycodeController {
  late String code;
  String? email;
  StatusRequest? statusRequest = StatusRequest.none;
  Curd curd = Curd();
  Veri_Pass_Data sigupData = Veri_Pass_Data(Get.put(Curd()));
  List data = [];

  @override
  gotopage(code) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await sigupData.PostData(email!, code);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.ReseltPass, arguments: {
          "email": email.toString(),
        });
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "Verify Code Not Correct");
      }
    }
    update();
  }

  @override
  chick() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
