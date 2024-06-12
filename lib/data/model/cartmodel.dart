class CartModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUserid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDatetiem;
  int? itemsCategories;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetiem,
      this.itemsCategories});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetiem = json['items_datetiem'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetiem'] = this.itemsDatetiem;
    data['items_categories'] = this.itemsCategories;
    return data;
  }
}
