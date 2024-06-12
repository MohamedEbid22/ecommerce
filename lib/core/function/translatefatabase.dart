import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

translateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
