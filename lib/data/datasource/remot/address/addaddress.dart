import 'package:ecommercee/core/class/curd.dart';
import 'package:ecommercee/linkapi.dart';

class AddAddress {
  Curd curd;
  AddAddress(this.curd);
  adddata(
    String userid,
    String name,
    String city,
    String street,
  ) async {
    var response = await curd.PostData(AppLinke.LinkAddAddress, {
      "address_userid": userid,
      "address_name": name,
      "address_city": city,
      "address_street": street,
    });

    return response.fold((l) => l, (r) => r);
  }

  editdata(
    String id,
    String name,
    String city,
    String street,
  ) async {
    var response = await curd.PostData(AppLinke.LinkEditAddress, {
      "address_id": id,
      "address_name": name,
      "address_city": city,
      "address_street": street,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String address_userid) async {
    var response = await curd.PostData(AppLinke.LinkViewAddress,
        {"address_userid": address_userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  delet(String address_id) async {
    var response = await curd.PostData(
        AppLinke.LinkDeleteAddress, {"address_id": address_id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
