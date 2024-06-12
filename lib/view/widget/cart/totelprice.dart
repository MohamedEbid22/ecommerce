import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class TotelPrice extends StatelessWidget {
  final double price;
  const TotelPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Totel :",
          style: TextStyle(color: colorApp.grey),
        ),
        Row(
          children: [
            Container(
              child: Text(
                "\$ ",
                style: TextStyle(fontSize: 13, color: Colors.green),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1),
              child: Text(
                "${price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
