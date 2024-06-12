import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/function/handlingData.dart';
import 'package:ecommercee/data/datasource/remot/auth/ver_email_data.dart';
import 'package:get/get.dart';

abstract class VerifyEmailController extends GetxController {
  chick();
  gotopage(String verifycode);
}

class VerifyEmailControllerImp extends VerifyEmailController {
  late String code;
  String? email;
  StatusRequest? statusRequest = StatusRequest.none;
  Curd curd = Curd();
  Veri_Emai_Data sigupData = Veri_Emai_Data(Get.put(Curd()));
  List data = [];

  @override
  gotopage(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await sigupData.PostData(email!, verifycode);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.Suuccess_SignUp);
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
