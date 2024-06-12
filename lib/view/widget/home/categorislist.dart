import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/core/function/translatefatabase.dart';
import 'package:ecommercee/data/model/categoriesmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategorisList extends StatelessWidget {
  const CategorisList({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerIMP controller = Get.put(HomeControllerIMP());
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return categoris(
              i: index,
              categorisModel:
                  CategorisModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class categoris extends GetView<HomeControllerIMP> {
  final CategorisModel categorisModel;
  final int i;
  const categoris({super.key, required this.categorisModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoitems(
            controller.categories, i, categorisModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(224, 210, 210, 210),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.all(5),
            height: 90,
            width: 80,
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: SvgPicture.network(
              "${AppLinke.imagecategores}/${categorisModel.categoriesImage}",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${translateDatabase(categorisModel.categoriesNameAr, categorisModel.categoriesName)}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }
}
