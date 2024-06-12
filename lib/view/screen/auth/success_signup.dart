import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/auth/bouttonauth.dart';
import 'package:ecommercee/view/widget/auth/titleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Success_SignUp extends StatelessWidget {
  const Success_SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.orange,
      ),
      body: Container(
        child: ListView(children: [
          Container(
            alignment: Alignment.center,
            height: 230,
            padding: const EdgeInsets.only(top: 0, left: 35, right: 35),
            child: Column(
              children: [
                TitleAuth(title: "Successed"),
                SizedBox(
                  height: 15,
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 150,
                )
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colorApp.orange, Color.fromARGB(241, 255, 153, 0)]),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thank You!",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: colorApp.grey, fontSize: 35),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign Up done Successfully",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color.fromARGB(255, 172, 172, 172),
                    fontSize: 20,
                    height: 1.8),
                textAlign: TextAlign.center,
              ),
              Text(
                "You must go to login",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color.fromARGB(255, 172, 172, 172),
                    fontSize: 20,
                    height: 1.8),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              ButtonAuth(
                onPressed: () {
                  Get.offNamed(AppRoutes.Login);
                },
                child: "Go To Login",
              ),
            ],
          )
        ]),
      ),
    );
  }
}
