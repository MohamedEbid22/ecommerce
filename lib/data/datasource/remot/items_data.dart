import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);
  getData(String categories_id, String user_id) async {
    var response = await curd.PostData(AppLinke.Linkitemslist,
        {"categories_id": categories_id.toString(), "user_id": user_id});
    return response.fold((l) => l, (r) => r);
  }
}
