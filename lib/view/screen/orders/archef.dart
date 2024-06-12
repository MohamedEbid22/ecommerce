import 'package:ecommercee/controller/orders/archivecontroller.dart';
import 'package:ecommercee/controller/orders/pandingcontrolle.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrderPandinga extends StatelessWidget {
  const OrderPandinga({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPandingaController());
    Get.put(OrdersPandingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.grey,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Orders archive",
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
                color: Color.fromARGB(255, 255, 255, 255),
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
              child: GetBuilder<OrdersPandingaController>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest!,
                        widget: ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardOrdersData(
                              listdata: controller.data[index],
                            );
                          },
                        ),
                      ))),
        ],
      ),
    );
  }
}
