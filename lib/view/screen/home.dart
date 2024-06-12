import 'package:ecommercee/controller/home_controller.dart';
import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:ecommercee/view/widget/home/appar.dart';
import 'package:ecommercee/view/widget/home/categorislist.dart';
import 'package:ecommercee/view/widget/home/discountbord.dart';
import 'package:ecommercee/view/widget/home/itemslist.dart';
import 'package:ecommercee/view/widget/home/titelhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeControllerIMP controller = Get.put(HomeControllerIMP());
  late ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appar(
          titeltext: "find the product",
          onPressedsearch: () {
            controller.iconsearch();
          },
          onPressedfavert: () {
            Get.toNamed(AppRoutes.FaveritPage);
          },
          Mycontroller: controller.search!,
          onChanged: (val) {
            controller.chicksearch(val);
          },
        ),
      ),
      body: GetBuilder<HomeControllerIMP>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListView(
                    children: [
                      controller.issearch
                          ? searchwidget(
                              itemsdata: controller.listdata,
                            )
                          : Column(
                              children: [
                                if (controller.settinghome.isNotEmpty)
                                  DiscountBord(
                                      titel:
                                          "${controller.settinghome[0]["settinghome_titel"]}",
                                      body:
                                          "${controller.settinghome[0]["settinghome_body"]}"),
                                TitelHome(text: "Categories"),
                                CategorisList(),
                                SizedBox(
                                  height: 10,
                                ),
                                TitelHome(text: "Top Selling"),
                                ItemsList(),
                              ],
                            )
                    ],
                  ),
                ),
              )),
    );
  }
}

class searchwidget extends StatelessWidget {
  final List<ItemsModel> itemsdata;

  const searchwidget({Key? key, required this.itemsdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerIMP controller = Get.put(HomeControllerIMP());
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemsdata.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.PageProductDetails(itemsdata[index]);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.network(
                        AppLinke.imageitems +
                            "/" +
                            itemsdata[index].itemsImage!,
                        height: 110,
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text("${itemsdata[index].itemsName!}"),
                            subtitle:
                                Text("${itemsdata[index].categoriesName!}"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
