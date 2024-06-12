import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class OfferData {
  Curd curd;
  OfferData(this.curd);
  getData() async {
    var response = await curd.PostData(AppLinke.Linkoffer, {});
    return response.fold((l) => l, (r) => r);
  }
}
