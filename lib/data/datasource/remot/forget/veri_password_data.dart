import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class Veri_Pass_Data {
  Curd curd;
  Veri_Pass_Data(this.curd);
  PostData(
    String email,
    String verifycode,
  ) async {
    var response = await curd.PostData(AppLinke.Linkveripassword, {
      "email": email,
      "verifycode": verifycode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
