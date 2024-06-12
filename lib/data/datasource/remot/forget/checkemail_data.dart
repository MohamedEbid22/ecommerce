import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class Check_Emai_Data {
  Curd curd;
  Check_Emai_Data(this.curd);
  PostData(
    String email,
  ) async {
    var response = await curd.PostData(AppLinke.Linkcheckemil, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
