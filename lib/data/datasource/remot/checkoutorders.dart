import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class CheckoutOrders {
  Curd curd;
  CheckoutOrders(this.curd);
  checkoutorder(Map data) async {
    var response = await curd.PostData(AppLinke.Linkcheckout, data);
    return response.fold((l) => l, (r) => r);
  }
}
