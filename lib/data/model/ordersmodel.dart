class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersPayment;
  double? ordersTotelprice;
  int? ordersStutes;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPayment,
      this.ordersTotelprice,
      this.ordersStutes});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPayment = json['orders_payment'];
    ordersTotelprice =
        json['orders_totelprice']?.toDouble(); // Add the toDouble() method here
    ordersStutes = json['orders_stutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_payment'] = this.ordersPayment;
    data['orders_totelprice'] = this.ordersTotelprice;
    data['orders_stutes'] = this.ordersStutes;
    return data;
  }
}
