import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class FavertPageData {
  Curd curd;
  FavertPageData(this.curd);

  getdata(String user_id) async {
    var response =
        await curd.PostData(AppLinke.LinkFavView, {"user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }

  deletdata(String favorite_id) async {
    var response = await curd.PostData(
        AppLinke.LinkFavDelet, {"favorite_id": favorite_id});
    return response.fold((l) => l, (r) => r);
  }
}
