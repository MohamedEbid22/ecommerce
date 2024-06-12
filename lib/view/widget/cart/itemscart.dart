import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';

class ItemsCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? add;
  final void Function()? remove;
  const ItemsCart(
      {super.key,
      required this.name,
      required this.price,
      required this.add,
      required this.remove,
      required this.count,
      required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Image.network(
                  "${AppLinke.imageitems}/$imagename",
                )),
            Expanded(
                flex: 6,
                child: ListTile(
                  title: Text("${name}"),
                  subtitle: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          "\$",
                          style: TextStyle(fontSize: 13, color: Colors.green),
                        ),
                      ),
                      Text(
                        "${price}",
                        style: TextStyle(fontSize: 18, color: colorApp.grey),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: add,
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                    Text(
                      "${count}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(192, 243, 85, 46)),
                    ),
                    IconButton(
                        onPressed: remove,
                        icon: Icon(
                          Icons.remove,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
