import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class Veri_Emai_Data {
  Curd curd;
  Veri_Emai_Data(this.curd);
  PostData(
    String email,
    String verifycode,
  ) async {
    var response = await curd.PostData(AppLinke.Linkveriemail, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
