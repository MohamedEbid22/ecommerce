import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class resut_Data {
  Curd curd;
  resut_Data(this.curd);
  PostData(
    String email,
    String password,
  ) async {
    var response = await curd.PostData(AppLinke.Linkresutepassword, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
