import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class FavertData {
  Curd curd;
  FavertData(this.curd);
  add(String user_id, String items_id) async {
    var response = await curd.PostData(
        AppLinke.LinkFavAdd, {"user_id": user_id, "items_id": items_id});
    return response.fold((l) => l, (r) => r);
  }

  remove(String user_id, String items_id) async {
    var response = await curd.PostData(
        AppLinke.LinkFavRemove, {"user_id": user_id, "items_id": items_id});
    return response.fold((l) => l, (r) => r);
  }
}
