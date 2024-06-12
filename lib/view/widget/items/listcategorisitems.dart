import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/categoriesmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategorisListitems extends GetView<ItemsControllerIMP> {
  const CategorisListitems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoris.length,
        itemBuilder: (BuildContext context, int index) {
          return categoris(
              i: index,
              categorisModel:
                  CategorisModel.fromJson(controller.categoris[index]));
        },
      ),
    );
  }
}

class categoris extends GetView<ItemsControllerIMP> {
  final CategorisModel categorisModel;
  final int i;
  const categoris({super.key, required this.categorisModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeitem(i, categorisModel.categoriesId!);
      },
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GetBuilder<ItemsControllerIMP>(
            builder: (controller) => Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      border: controller.selectedcat == i
                          ? Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color:
                                      const Color.fromARGB(223, 240, 132, 105)))
                          : null),
                  child: Text(
                    "${categorisModel.categoriesName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: controller.selectedcat == i
                            ? Color.fromARGB(225, 43, 43, 43)
                            : colorApp.grey),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
