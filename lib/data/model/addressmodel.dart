class AddressModel {
  int? addressId;
  int? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;

  AddressModel(
      {this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    return data;
  }
}
