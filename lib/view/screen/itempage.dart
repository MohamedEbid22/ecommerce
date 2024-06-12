import 'package:ecommercee/controller/favert_controller.dart';
import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/imageasstes.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/view/screen/home.dart';
import 'package:ecommercee/view/widget/home/appar.dart';
import 'package:ecommercee/view/widget/items/listcategorisitems.dart';
import 'package:ecommercee/view/widget/items/listitems_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerIMP controllerr = Get.put(ItemsControllerIMP());
    FavertController controllerfav = Get.put(FavertController());
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Appar(
                  titeltext: "find the product",
                  onPressedsearch: () {
                    controllerr.iconsearch();
                  },
                  onPressedfavert: () {
                    Get.toNamed(AppRoutes.FaveritPage);
                  },
                  Mycontroller: controllerr.search!,
                  onChanged: (val) {
                    controllerr.chicksearch(val);
                  },
                ),
                GetBuilder<ItemsControllerIMP>(
                    builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest!,
                        widget: controller.issearch
                            ? searchwidget(itemsdata: controller.listdata)
                            : ListView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  const CategorisListitems(),
                                  GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.data.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio:
                                            .63, // تعديل النسبة بين عرض وارتفاع العناصر
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        controllerfav.myfavert[controller
                                                .data[index]['items_id']] =
                                            controller.data[index]['favoret'];
                                        return ItemList_Items(
                                            itemsModel: ItemsModel.fromJson(
                                                controller.data[index]));
                                      })
                                ],
                              )))
              ],
            )));
  }
}
