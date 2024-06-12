import 'package:ecommercee/controller/auth/forget_conteroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/function/valedthion.dart';
import 'package:ecommercee/view/widget/auth/bodyauth.dart';
import 'package:ecommercee/view/widget/auth/bouttonauth.dart';
import 'package:ecommercee/view/widget/auth/iconauth.dart';
import 'package:ecommercee/view/widget/auth/textdwon.dart';
import 'package:ecommercee/view/widget/auth/textform.dart';
import 'package:ecommercee/view/widget/auth/titleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorApp.orange,
          title: const Text(
            "Forget Password ",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 227, 227, 227)),
          ),
        ),
        body: GetBuilder<ForgetPassControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    child: Form(
                      key: controller.forgetkey,
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
                              TitleAuth(title: "Chick Email"),
                              SizedBox(
                                height: 10,
                              ),
                              BodyAuth(
                                  body:
                                      "Sign In With Your Email And Password\n OR Continue With Social Media"),
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
                            controller.email = val;
                          },
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 7, 50, "email");
                          },
                          hintText: "Enter Your Email",
                          label: "Email",
                          suffixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonAuth(
                            onPressed: () {
                              controller.chick();
                            },
                            child: "Chick"),
                        TextDowunAuth(
                          textone: "Don't have an account ? ",
                          texttwo: "Sign Up",
                          onTap: () {
                            controller.gotopage();
                          },
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
