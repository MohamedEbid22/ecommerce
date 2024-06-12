import 'package:ecommercee/controller/auth/resetepass_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/function/valedthion.dart';
import 'package:ecommercee/view/widget/auth/bodyauth.dart';
import 'package:ecommercee/view/widget/auth/bouttonauth.dart';
import 'package:ecommercee/view/widget/auth/iconauth.dart';
import 'package:ecommercee/view/widget/auth/textform.dart';
import 'package:ecommercee/view/widget/auth/titleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReseltPass extends StatelessWidget {
  const ReseltPass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetePassControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorApp.orange,
          title: const Text(
            "ResetPassword ",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 227, 227, 227)),
          ),
        ),
        body: GetBuilder<ResetePassControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    child: Form(
                      key: controller.resetpasswoedey,
                      child: ListView(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 230,
                          padding: const EdgeInsets.only(
                              top: 23, left: 35, right: 35),
                          child: Column(
                            children: [
                              IconAuth(iconauth: Icons.shopping_cart_outlined),
                              SizedBox(
                                height: 10,
                              ),
                              TitleAuth(title: "New Password"),
                              SizedBox(
                                height: 10,
                              ),
                              BodyAuth(body: "Please Enter new Password"),
                            ],
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  colorApp.orange,
                                  Color.fromARGB(241, 255, 153, 0)
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextForm(
                          onsaved: (val) {
                            controller.password = val;
                          },
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 6, 30, "password");
                          },
                          hintText: "Enter Your Password",
                          label: "Password",
                          suffixIcon: Icons.lock_outline,
                        ),
                        TextForm(
                          onsaved: (val) {
                            controller.repassword = val;
                          },
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 6, 30, "password");
                          },
                          hintText: "Re Enter Your Password",
                          label: "Password",
                          suffixIcon: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonAuth(
                            onPressed: () {
                              controller.chick();
                            },
                            child: "Save"),
                      ]),
                    ),
                  ),
                )));
  }
}
