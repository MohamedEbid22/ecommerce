import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class TastData {
  Curd curd;
  TastData(this.curd);
  getData() async {
    var response = await curd.PostData(AppLinke.Linktast, {});
    return response.fold((l) => l, (r) => r);
  }
}
