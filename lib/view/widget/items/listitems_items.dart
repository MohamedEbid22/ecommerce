import 'package:ecommercee/controller/favert_controller.dart';
import 'package:ecommercee/controller/items_controller.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemList_Items extends GetView<ItemsControllerIMP> {
  final ItemsModel itemsModel;

  // final bool active;
  const ItemList_Items({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Container(
          height: 600,
          child: InkWell(
            child: Card(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.network(
                          AppLinke.imageitems + "/" + itemsModel.itemsImage!,
                          height: 120,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        itemsModel.itemsName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, color: Color.fromARGB(255, 9, 9, 9)),
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
                              style: TextStyle(color: colorApp.grey),
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
                        padding: EdgeInsets.only(left: 7, right: 0, top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${itemsModel.itemspriceafterdis.toString()}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 229, 49, 49)),
                                ),
                                Text(
                                  " \$",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 46, 142, 2)),
                                ),
                              ],
                            ),
                            GetBuilder<FavertController>(
                                builder: (controller) => InkWell(
                                    onTap: () {
                                      if (controller
                                              .myfavert[itemsModel.itemsId] ==
                                          "1") {
                                        controller.isfavert(
                                            itemsModel.itemsId, "0");
                                        controller
                                            .removefavert(itemsModel.itemsId);
                                      } else {
                                        controller.isfavert(
                                            itemsModel.itemsId, "1");
                                        controller
                                            .addfavert(itemsModel.itemsId);
                                      }
                                    },
                                    child: Icon(
                                      controller.myfavert[itemsModel.itemsId] ==
                                              "1"
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Color.fromARGB(255, 218, 15, 0),
                                    )))
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (itemsModel.itemsDiscount != 0)
                    Image.asset(
                      "assets/images/sale.png",
                      height: 35,
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
