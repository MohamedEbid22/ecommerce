class AppLinke {
  static const String LinkServer = "http://localhost/ecommerce_php_data";
  static const String Linktast = "$LinkServer/tast.php";
  // =========auth==============================
  static const String Linksignup = "$LinkServer/auth/signup.php";
  static const String Linkveriemail = "$LinkServer/auth/verifycode.php";
  static const String Linklogin = "$LinkServer/auth/login.php";
  // =========forget=============================
  static const String Linkcheckemil = "$LinkServer/forget/checkemail.php";
  static const String Linkveripassword =
      "$LinkServer/forget/verifypassword.php";
  static const String Linkresutepassword =
      "$LinkServer/forget/resutepassword.php";

  //================home=========================
  static const String Linkhome = "$LinkServer/home/home.php";
  static const String Linkitemslist = "$LinkServer/items/items_list.php";
  static const String Linkitemssearch = "$LinkServer/items/search.php";

  //================image=========================
  static const String imagestitc =
      "http://localhost/ecommerce_php_data/upload/";
  static const String imagecategores = "$imagestitc/categ";
  static const String imageitems = "$imagestitc/itmes";
  //==================FAVERT=======================
  static const String LinkFavAdd = "$LinkServer/favert/add.php";
  static const String LinkFavRemove = "$LinkServer/favert/remove.php";
  static const String LinkFavView = "$LinkServer/favert/view.php";
  static const String LinkFavDelet = "$LinkServer/favert/delet.php";
  //=====================cart======================
  static const String LinkcartView = "$LinkServer/cart/view.php";
  static const String LinkcartAdd = "$LinkServer/cart/add.php";
  static const String LinkcartDelet = "$LinkServer/cart/delet.php";
  static const String Linkcartgetcount = "$LinkServer/cart/getcount.php";
  //=====================address======================
  static const String LinkAddAddress = "$LinkServer/address/add.php";
  static const String LinkViewAddress = "$LinkServer/address/view.php";
  static const String LinkEditAddress = "$LinkServer/address/edite.php";
  static const String LinkDeleteAddress = "$LinkServer/address/delete.php";
  //==========================coupon====================
  static const String Linkchickcoupon = "$LinkServer/coupon/chickcoupon.php";
  //=============================Checkout=================
  static const String Linkcheckout =
      "http://localhost/ecommerce_php_data/orders/checkoutorders.php";

  //=============================orders=================
  static const String Linkorderpanding = "$LinkServer/orders/panding.php";
  static const String Linkorderarshef = "$LinkServer/orders/arshef.php";
  static const String Linkordedelete = "$LinkServer/orders/delete.php";
  //================================offer================
  static const String Linkoffer = "$LinkServer/offer/view.php";
}
