import 'package:ecommercee/controller/auth/signup_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/function/valedthion.dart';
import 'package:ecommercee/view/widget/auth/bodyauth.dart';
import 'package:ecommercee/view/widget/auth/bouttonauth.dart';
import 'package:ecommercee/view/widget/auth/textdwon.dart';
import 'package:ecommercee/view/widget/auth/textform.dart';
import 'package:ecommercee/view/widget/auth/titleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorApp.orange,
          title: const Text(
            "Sign Up ",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 227, 227, 227)),
          ),
        ),
        body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    child: Form(
                      key: controller.signupkey,
                      child: ListView(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: const EdgeInsets.only(
                              top: 10, left: 35, right: 35),
                          child: Column(
                            children: [
                              TitleAuth(title: "Welcome Back"),
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
                                bottomLeft: Radius.circular(80)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  colorApp.orange,
                                  Color.fromARGB(241, 255, 153, 0)
                                ]),
                          ),
                        ),
                        TextForm(
                          onsaved: (val) {
                            controller.username = val;
                          },
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 5, 20, "username");
                          },
                          hintText: "Enter Your UserName",
                          label: "UserName",
                          suffixIcon: Icons.person_outlined,
                        ),
                        SizedBox(
                          height: 5,
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
                          height: 5,
                        ),
                        TextForm(
                          onsaved: (val) {
                            controller.phone = val;
                          },
                          isNum: true,
                          valed: (val) {
                            return validInput(val!, 5, 16, "phone");
                          },
                          hintText: "Enter Your Phone",
                          label: "Phone",
                          suffixIcon: Icons.phone_outlined,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GetBuilder<SignUpControllerImp>(
                          builder: (controller) => TextForm(
                            onsaved: (val) {
                              controller.password = val;
                            },
                            onTap: () {
                              controller.changedisplaypasswoed();
                            },
                            obscureText: controller.display,
                            isNum: false,
                            valed: (val) {
                              return validInput(val!, 6, 30, "password");
                            },
                            hintText: "Enter Your Password",
                            label: "Password",
                            suffixIcon: Icons.lock_outline,
                          ),
                        ),
                        ButtonAuth(
                            onPressed: () {
                              controller.signup();
                            },
                            child: "Sign In"),
                        TextDowunAuth(
                          textone: " have an account ?  ",
                          texttwo: "Sign In",
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
