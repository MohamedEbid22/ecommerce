import 'package:ecommercee/controller/faveritpage_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/view/screen/home.dart';
import 'package:ecommercee/view/widget/cart/appbar.dart';
import 'package:ecommercee/view/widget/faveritpage_items.dart';
import 'package:ecommercee/view/widget/home/appar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FaveritPage extends StatelessWidget {
  const FaveritPage({super.key});

  @override
  Widget build(BuildContext context) {
    FaveritPageController controller = Get.put(FaveritPageController());
    return Scaffold(
        appBar: AppBar(
          title: Appar(
            titeltext: "find the product",
            onPressedsearch: () {
              controller.iconsearch();
            },
            onPressedfavert: () {},
            Mycontroller: controller.search!,
            onChanged: (val) {
              controller.chicksearch(val);
            },
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: ListView(children: [
              GetBuilder<FaveritPageController>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: controller.issearch
                          ? searchwidget(itemsdata: controller.listdata)
                          : Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: HandlingDataView(
                                        statusRequest:
                                            controller.statusRequest!,
                                        widget: ListView(
                                          children: [
                                            GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    controller.data.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio:
                                                      .63, // تعديل النسبة بين عرض وارتفاع العناصر
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return FaveritPage_items(
                                                    faveritModel:
                                                        controller.data[index],
                                                  );
                                                })
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            )))
            ])));
  }
}
