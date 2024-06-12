import 'package:ecommercee/controller/auth/verifyemail_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/auth/bodyauth.dart';
import 'package:ecommercee/view/widget/auth/iconauth.dart';
import 'package:ecommercee/view/widget/auth/titleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorApp.orange,
          title: const Text(
            "Verification Email ",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 227, 227, 227)),
          ),
        ),
        body: GetBuilder<VerifyEmailControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    child: ListView(children: [
                      Container(
                        alignment: Alignment.center,
                        height: 230,
                        padding:
                            const EdgeInsets.only(top: 23, left: 35, right: 35),
                        child: Column(
                          children: [
                            const IconAuth(
                                iconauth: Icons.shopping_cart_outlined),
                            SizedBox(
                              height: 10,
                            ),
                            TitleAuth(title: "Chick Code"),
                            SizedBox(
                              height: 10,
                            ),
                            BodyAuth(
                                body:
                                    "Please Enter The Digit Code Sent To Mohamedebid194@gmail.com"),
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
                        height: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtpTextField(
                            numberOfFields: 5,
                            fieldWidth: 50,
                            borderColor: colorApp.orange,
                            borderRadius: BorderRadius.circular(15),
                            showFieldAsBox: true,
                            focusedBorderColor: colorApp.orange,
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.gotopage(verificationCode);
                            }, // end onSubmit
                          ),
                        ],
                      ),
                    ]),
                  ),
                )));
  }
}
