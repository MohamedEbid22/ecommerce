import 'package:ecommercee/controller/favert_controller.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/itemsmodel.dart';
import 'package:ecommercee/data/model/offermodel.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:ecommercee/view/screen/home.dart';
import 'package:ecommercee/view/widget/home/appar.dart';
import 'package:ecommercee/view/widget/offers/offersitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommercee/controller/offercontroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';

class Offer extends StatelessWidget {
  const Offer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ItemsModel itemsModel;
    OfferController controllerr = Get.put(OfferController());

    FavertController controllerfav = Get.put(FavertController());

    return Scaffold(
        appBar: AppBar(
          title: Appar(
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
        ),
        body: GetBuilder<OfferController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controllerr.issearch
                    ? searchwidget(
                        itemsdata: controllerr.listdata,
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      height: 260,
                                      child: InkWell(
                                        onTap: () {
                                          controller.goToPageProductDetails(
                                              controllerr.list[index]);
                                        },
                                        child: Card(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 5,
                                                left: 70,
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color: colorApp.orange,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                ),
                                              ),
                                              Positioned(
                                                top: 20,
                                                left: 150,
                                                child: Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          136, 255, 175, 155),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    child: Image.network(
                                                      AppLinke.imageitems +
                                                          "/" +
                                                          controller.list[index]
                                                              .itemsImage!,
                                                      height: 130,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Text(
                                                    controller
                                                        .list[index].itemsName!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Color.fromARGB(
                                                            255, 9, 9, 9),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5,
                                                        right: 5,
                                                        top: 2),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Reating 3.5 ",
                                                          style: TextStyle(
                                                              color: colorApp
                                                                  .grey),
                                                        ),
                                                        ...List.generate(
                                                            5,
                                                            (index) => Icon(
                                                                Icons
                                                                    .star_rate_rounded,
                                                                size: 15,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        255,
                                                                        179,
                                                                        0))),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 7,
                                                        right: 0,
                                                        top: 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${controller.list[index].itemspriceafterdis.toString()}",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          229,
                                                                          49,
                                                                          49),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "\$",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          46,
                                                                          142,
                                                                          2)),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (controller.list[index]
                                                      .itemsDiscount !=
                                                  0)
                                                Image.asset(
                                                  "assets/images/sale.png",
                                                  height: 45,
                                                ),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                                ;
                              },
                            ),
                          ),
                        ],
                      ))));
  }
}
