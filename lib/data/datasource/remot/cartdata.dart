import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class CartData {
  Curd curd;
  CartData(this.curd);
  add(String user_id, String items_id) async {
    var response = await curd.PostData(
        AppLinke.LinkcartAdd, {"user_id": user_id, "items_id": items_id});
    return response.fold((l) => l, (r) => r);
  }

  remove(String user_id, String items_id) async {
    var response = await curd.PostData(
        AppLinke.LinkcartDelet, {"user_id": user_id, "items_id": items_id});
    return response.fold((l) => l, (r) => r);
  }

  count(String user_id, String items_id) async {
    var response = await curd.PostData(
        AppLinke.Linkcartgetcount, {"user_id": user_id, "items_id": items_id});
    return response.fold((l) => l, (r) => r);
  }
  

  veiw(String user_id) async {
    var response =
        await curd.PostData(AppLinke.LinkcartView, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  chickcoupon(String coupon_name) async {
    var response = await curd.PostData(
        AppLinke.Linkchickcoupon, {"coupon_name": coupon_name});
    return response.fold((l) => l, (r) => r);
  }
}
