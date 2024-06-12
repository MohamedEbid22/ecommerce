import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ItemsPrice extends StatelessWidget {
  final void Function()? add;
  final void Function()? remove;
  final String count;
  final String price;

  const ItemsPrice({
    super.key,
    required this.add,
    required this.remove,
    required this.count,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 7),
              child: Text(
                "\$",
                style: TextStyle(fontSize: 12, color: Colors.green),
              ),
            ),
            Text(
              "${price}",
              style: TextStyle(
                  color: colorApp.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: IconButton(
              onPressed: add,
              icon: Icon(Icons.add),
            )),
            Container(
                child: Text(
              "${count}",
              style: TextStyle(
                  color: colorApp.orange,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
            Container(
                child: IconButton(
              onPressed: remove,
              icon: Icon(Icons.remove),
            ))
          ],
        ),
      ],
    );
  }
}
