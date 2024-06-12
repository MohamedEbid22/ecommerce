import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class formandimage extends StatelessWidget {
  final String imagename;
  final String titele;
  final bool active;
  const formandimage(
      {super.key,
      required this.imagename,
      required this.titele,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: const Color.fromARGB(223, 225, 225, 225),
          borderRadius: BorderRadius.circular(360),
          border: Border.all(
              color: active == true ? colorApp.orange : Colors.white,
              width: .8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            height: 80,
          ),
          Text(
            titele,
            style: TextStyle(
                fontSize: 18,
                color: colorApp.orange,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
