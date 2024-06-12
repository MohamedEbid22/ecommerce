import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceCart extends StatelessWidget {
  final double sub;
  final double tax;
  const PriceCart({super.key, required this.sub, required this.tax});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Text(
              "Subtotal: ",
              style: TextStyle(
                  fontSize: 15,
                  color: colorApp.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "\$",
              style: TextStyle(fontSize: 13, color: Colors.green),
            ),
            Text(
              "${sub}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Taxes: ",
              style: TextStyle(
                  fontSize: 15,
                  color: colorApp.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "\$",
              style: TextStyle(fontSize: 13, color: Colors.green),
            ),
            Text(
              "${tax}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
