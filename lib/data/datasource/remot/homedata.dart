import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  getData() async {
    var response = await curd.PostData(AppLinke.Linkhome, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response =
        await curd.PostData(AppLinke.Linkitemssearch, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
