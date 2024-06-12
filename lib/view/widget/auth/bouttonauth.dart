import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({super.key, required this.onPressed, required this.child});
  final Function()? onPressed;
  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(40),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [colorApp.orange, Color.fromARGB(241, 255, 153, 0)]),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            child,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
