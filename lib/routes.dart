import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/middleware/mymiddleware.dart';
import 'package:ecommercee/view/screen/address/add.dart';
import 'package:ecommercee/view/screen/address/view.dart';
import 'package:ecommercee/view/screen/auth/forget_password/forget.dart';
import 'package:ecommercee/view/screen/auth/login.dart';
import 'package:ecommercee/view/screen/auth/forget_password/resetpassword.dart';
import 'package:ecommercee/view/screen/auth/signup.dart';
import 'package:ecommercee/view/screen/auth/forget_password/success_resetpassword.dart';
import 'package:ecommercee/view/screen/auth/success_signup.dart';
import 'package:ecommercee/view/screen/auth/forget_password/verifycod.dart';
import 'package:ecommercee/view/screen/auth/verifychickemail.dart';
import 'package:ecommercee/view/screen/cartpage.dart';
import 'package:ecommercee/view/screen/checkout.dart';
import 'package:ecommercee/view/screen/faveritpage.dart';
import 'package:ecommercee/view/screen/homescreen.dart';
import 'package:ecommercee/view/screen/itempage.dart';
import 'package:ecommercee/view/screen/language.dart';
import 'package:ecommercee/view/screen/omboarding.dart';
import 'package:ecommercee/view/screen/orders/archef.dart';
import 'package:ecommercee/view/screen/orders/panding.dart';
import 'package:ecommercee/view/screen/productdetails.dart';
import 'package:ecommercee/view/screen/setting_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Language(), middlewares: [My_Middlware()]),
  //================================ Auth=======================================
  GetPage(name: AppRoutes.Login, page: () => Login()),
  GetPage(name: AppRoutes.SignUp, page: () => SignUp()),
  GetPage(name: AppRoutes.Forget, page: () => Forgetpass()),
  GetPage(name: AppRoutes.ReseltPass, page: () => ReseltPass()),
  GetPage(name: AppRoutes.VerifyCode, page: () => VerifyCode()),
  GetPage(name: AppRoutes.Suuccess_ReseltPass, page: () => Success_ResetPass()),
  GetPage(name: AppRoutes.Suuccess_SignUp, page: () => Success_SignUp()),
  GetPage(name: AppRoutes.VerifyEmail, page: () => VerifyEmail()),
// =================================Onboarding==================================
  GetPage(name: AppRoutes.Onboarding, page: () => Onboarding()),
  // screen
  GetPage(name: AppRoutes.Homepage, page: () => HomeScreen()),
  GetPage(name: AppRoutes.ItemPage, page: () => ItemPage()),
  GetPage(name: AppRoutes.Setting, page: () => SettingPage()),
  //============================================================================
  GetPage(name: AppRoutes.productdetails, page: () => const ProductDetails()),
  //===========================faverit==========================================
  GetPage(name: AppRoutes.FaveritPage, page: () => const FaveritPage()),

  //==============================cart==========================================
  GetPage(name: AppRoutes.CartPage, page: () => const CartPage()),
  //==============================address==========================================
  GetPage(name: AppRoutes.addressview, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressadd, page: () => const AddressAdd()),
  //============================CheckOut==================================
  GetPage(name: AppRoutes.CheckOut, page: () => const CheckOut()),
  //============================Orders==================================
  GetPage(name: AppRoutes.OrderPanding, page: () => const OrderPanding()),
  GetPage(name: AppRoutes.OrderArchive, page: () => const OrderPandinga()),
];
