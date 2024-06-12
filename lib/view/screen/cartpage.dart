import 'package:ecommercee/controller/cartpagecontroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/cart/itemscart.dart';
import 'package:ecommercee/view/widget/cart/pricecart.dart';
import 'package:ecommercee/view/widget/cart/totelprice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorApp.grey,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Cart",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: 15,
              width: double.infinity,
              color: colorApp.grey,
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      200.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<CartPageController>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest!,
                      widget: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: colorApp.greyopane,
                              child: ListView(
                                children: [
                                  ...List.generate(
                                    controller.data.length,
                                    (index) => ItemsCart(
                                      name:
                                          '${controller.data[index].itemsName}',
                                      price: controller.data[index].itemsprice
                                          .toString(),
                                      count:
                                          "${controller.data[index].countitems}",
                                      add: () async {
                                        await controller.addcart(
                                            controller.data[index].itemsId);
                                        controller.refreshPage();
                                      },
                                      remove: () async {
                                        await controller.removecart(
                                            controller.data[index].itemsId);
                                        controller.refreshPage();
                                      },
                                      imagename:
                                          '${controller.data[index].itemsImage}',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  PriceCart(sub: controller.pricetotol, tax: 40)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            padding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller.couponname == null
                                    ? Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              controller:
                                                  controller.controllercoupon!,
                                              decoration: const InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 2,
                                                          horizontal: 10),
                                                  hintText: "Coupon Code",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20)))),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: 33,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Color.fromARGB(
                                                        192, 243, 85, 46)),
                                                child: MaterialButton(
                                                  onPressed: () {
                                                    controller.chickcoupon();
                                                  },
                                                  child: Text(
                                                    "apply",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Discount ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: colorApp.grey),
                                            ),
                                            Text(
                                              "${controller.discountcoupon}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              " \% ",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color.fromARGB(
                                                      255, 255, 7, 7)),
                                            ),
                                          ],
                                        ),
                                      ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TotelPrice(
                                      price: controller.gettotelprice(),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 150,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color:
                                              Color.fromARGB(192, 243, 85, 46)),
                                      child: MaterialButton(
                                        onPressed: () {
                                          controller.checkout();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Check Out",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.arrow_right_outlined,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))),
            )
          ],
        ));
  }
}
