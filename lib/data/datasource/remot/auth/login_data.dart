import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);
  PostData(
    String email,
    String password,
  ) async {
    var response = await curd.PostData(AppLinke.Linklogin, {
      "email": email,
      "password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
