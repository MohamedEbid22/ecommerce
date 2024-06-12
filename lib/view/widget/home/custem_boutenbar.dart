import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custem_ButtonNavBar extends StatelessWidget {
  final void Function()? onPressed;

  final IconData? icon;
  final Color? color;
  final bool active;

  const Custem_ButtonNavBar(
      {super.key, this.onPressed, this.icon, this.color, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 65,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            icon,
            color: active == true ? colorApp.orange : color,
            size: 28,
          ),
        ]),
      ),
    );
  }
}
