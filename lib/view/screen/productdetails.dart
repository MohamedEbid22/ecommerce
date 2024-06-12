import 'package:ecommercee/controller/productdetails_controler.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/linkapi.dart';
import 'package:ecommercee/view/widget/items/itemsprice.dart';
import 'package:ecommercee/view/widget/prodeuct/prodeuctbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControlerIPM controllerr =
        Get.put(ProductDetailsControlerIPM());

    return Scaffold(
        bottomNavigationBar: ButtonProdeuct(
          textbutton: 'Go to Car',
          onPressed: () {
            Get.offNamed(AppRoutes.CartPage);
          },
        ),
        appBar: AppBar(
          backgroundColor: colorApp.greyopane,
        ),
        body: GetBuilder<ProductDetailsControlerIPM>(
          builder: (controller) => Container(
              child: ListView(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                    color: colorApp.greyopane),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "${controllerr.itemsModel.itemsId}",
                      child: Image.network(
                        "${AppLinke.imageitems + "/" + controllerr.itemsModel.itemsImage!}",
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  color: colorApp.greyopane,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                              MediaQuery.of(context).size.width, 60.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${controllerr.itemsModel.itemsName}",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(224, 46, 46, 46),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ItemsPrice(
                            add: () {
                              controllerr.add();
                            },
                            remove: () {
                              controllerr.remove();
                            },
                            count: controllerr.count.toString(),
                            price: controllerr.itemsModel.itemspriceafterdis
                                .toString()),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "${controllerr.itemsModel.itemsDesc}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(225, 118, 118, 118)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Colors",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(225, 83, 83, 83),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(160),
                                    color: const Color.fromARGB(
                                        255, 189, 141, 58))),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(160),
                                    color: const Color.fromARGB(
                                        255, 114, 114, 114))),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(160),
                                    color: const Color.fromARGB(255, 0, 0, 0)))
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          )),
        ));
  }
}
