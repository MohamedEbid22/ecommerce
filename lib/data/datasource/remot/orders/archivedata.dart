import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class OrderArchiveData {
  Curd curd;
  OrderArchiveData(this.curd);
  getdata(String orders_userid) async {
    var response = await curd.PostData(
        AppLinke.Linkorderarshef, {"orders_userid": orders_userid});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String orders_id) async {
    var response =
        await curd.PostData(AppLinke.Linkordedelete, {"orders_id": orders_id});
    return response.fold((l) => l, (r) => r);
  }
}
