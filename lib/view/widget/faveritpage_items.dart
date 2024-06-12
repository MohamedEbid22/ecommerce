import 'package:ecommercee/controller/faveritpage_controller.dart';
import 'package:ecommercee/controller/favert_controller.dart';
import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/controller/productdetails_controler.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/faveritmodel.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class FaveritPage_items extends GetView<FavertController> {
  final FaveritModel faveritModel;

  // final bool active;
  const FaveritPage_items({
    super.key,
    required this.faveritModel,
  });

  @override
  Widget build(BuildContext context) {
    FaveritPageController controllerr = Get.put(FaveritPageController());

    return InkWell(
      onTap: () {},
      child: Container(
          height: 600,
          child: InkWell(
              child: Card(
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        color: colorApp.orange,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 50,
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(136, 255, 175, 155),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Image.network(
                        AppLinke.imageitems + "/" + faveritModel.itemsImage!,
                        height: 125,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      faveritModel.itemsName!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 9, 9, 9),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                      child: Row(
                        children: [
                          Text(
                            "Reating 3.5",
                            style: TextStyle(
                                color: const Color.fromARGB(226, 97, 97, 97)),
                          ),
                          ...List.generate(
                              5,
                              (index) => Icon(Icons.star_rate_rounded,
                                  size: 15, color: colorApp.grey)),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                        child: Container(
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12)),
                        color: const Color.fromARGB(223, 196, 196, 196),
                      ),
                      child: InkWell(
                        onTap: () {
                          controllerr
                              .deletdata(faveritModel.favoriteId!.toString());
                        },
                        child: Icon(
                          Icons.close,
                          color: colorApp.orange,
                          size: 28,
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ))),
    );
  }
}
