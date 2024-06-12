import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerIMP controller = Get.put(HomeControllerIMP());

    return Container(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.items.length,
        itemBuilder: (BuildContext context, int i) {
          return items(itemsModel: ItemsModel.fromJson(controller.items[i]));
        },
      ),
    );
  }
}

class items extends GetView<HomeControllerIMP> {
  final ItemsModel itemsModel;
  const items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  controller.goToPageProductDetails(itemsModel);
                },
                child: Container(
                  height: 110,
                  width: 150,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(224, 210, 210, 210),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  child: Image.network(
                      "${AppLinke.imageitems}/${itemsModel.itemsImage}",
                      height: 100),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${itemsModel.itemsName}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
