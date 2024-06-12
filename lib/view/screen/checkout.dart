import 'package:ecommercee/controller/checkoutcontroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/cart/appbar.dart';
import 'package:ecommercee/view/widget/checkout/address.dart';
import 'package:ecommercee/view/widget/checkout/formimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        body: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(223, 125, 125, 125),
          child: ListView(
            children: [
              Positioned(
                  top: 20,
                  left: 5,
                  right: 20,
                  child: AppBarC(
                      titel: "Check Out",
                      onPressed: () {
                        Get.back();
                      })),
              Positioned(
                  top: 85,
                  left: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: Color.fromARGB(255, 240, 238, 238)),
                      child: GetBuilder<CheckOutController>(
                          builder: (controller) => HandlingDataView(
                              statusRequest: controller.statusRequest!,
                              widget: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              226, 161, 163, 163),
                                        ),
                                        child: const Text(
                                          "Choose Payment Method",
                                          style: TextStyle(
                                              color: colorApp.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.getpayment("0");
                                            },
                                            child: formandimage(
                                                imagename:
                                                    'assets/images/cash.png',
                                                titele: "Cash",
                                                active:
                                                    controller.payment == "0"
                                                        ? true
                                                        : false),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.getpayment("1");
                                            },
                                            child: formandimage(
                                                imagename:
                                                    'assets/images/card.png',
                                                titele: "Card",
                                                active:
                                                    controller.payment == "1"
                                                        ? true
                                                        : false),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              226, 161, 163, 163),
                                        ),
                                        child: Text(
                                          "Choose Delivery Type",
                                          style: TextStyle(
                                              color: colorApp.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              controller.getdelivery("0");
                                            },
                                            child: formandimage(
                                                imagename:
                                                    'assets/images/moto3.png',
                                                titele: "delivery",
                                                active:
                                                    controller.delivery == "0"
                                                        ? true
                                                        : false),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.getdelivery("1");
                                            },
                                            child: formandimage(
                                                imagename:
                                                    'assets/images/car.png',
                                                titele: "recive",
                                                active:
                                                    controller.delivery == "1"
                                                        ? true
                                                        : false),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      if (controller.delivery == "0")
                                        Column(
                                          children: [
                                            const Text(
                                              "Choose Adderss",
                                              style: TextStyle(
                                                  color: colorApp.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            if (controller.data.isEmpty)
                                              Text('data'),
                                            ...List.generate(
                                              controller.data.length,
                                              (index) => InkWell(
                                                onTap: () {
                                                  controller.getaddress(
                                                      "${controller.data[index].addressId}");
                                                },
                                                child: addressshar(
                                                    titlename:
                                                        "${controller.data[index].addressName}",
                                                    subtitle:
                                                        "${controller.data[index].addressCity} ${controller.data[index].addressStreet}",
                                                    active: controller
                                                                .address ==
                                                            "${controller.data[index].addressId}"
                                                        ? true
                                                        : false),
                                              ),
                                            )
                                          ],
                                        )
                                    ],
                                  )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(192, 243, 85, 46)),
                                    child: MaterialButton(
                                      onPressed: () {
                                        controller.checkoutotder();
                                      },
                                      child: const Text(
                                        "Check Out",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ))))),
            ],
          )),
    ]));
  }
}
