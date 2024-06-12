import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class SigupData {
  Curd curd;
  SigupData(this.curd);
  PostData(
    String username,
    String email,
    String password,
    String phone,
  ) async {
    var response = await curd.PostData(AppLinke.Linksignup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
