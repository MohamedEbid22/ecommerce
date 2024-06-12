import 'package:ecommercee/controller/orders/pandingcontrolle.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

class CardOrdersData extends GetView<OrdersPandingController> {
  final OrdersModel listdata;
  const CardOrdersData({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    String output = "";
    String inputDateString = "${listdata.ordersDatetime!}";
    String inputFormatString = "yyyy-MM-dd HH:mm:ss";

    DateTime inputDate = DateFormat(inputFormatString).parse(inputDateString);
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(inputDate);
    int daysDifference = difference.inDays;
    int hoursDifference = difference.inHours;
    int minutesDifference = difference.inMinutes;
    if (daysDifference == 0) {
      if (hoursDifference == 0) {
        if (minutesDifference == 0) {
          difference.inSeconds;
          output = "Just now";
        } else {
          output = "$minutesDifference Min ago";
        }
      } else {
        output = "$hoursDifference hours ago";
      }
    } else {
      output = "$daysDifference days ago";
    }
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listdata.ordersId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Text(listdata.ordersDatetime!)
                Text(
                  "${output}",
                  style: const TextStyle(
                    color: colorApp.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "Order Type : ",
                  style: TextStyle(
                      color: Color.fromARGB(223, 31, 31, 31),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  controller.printOrderType(listdata.ordersType.toString()),
                  style: const TextStyle(
                      color: Color.fromARGB(225, 88, 88, 88),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Order Price : ",
                  style: TextStyle(
                      color: Color.fromARGB(223, 31, 31, 31),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  "${listdata.ordersPrice}",
                  style: const TextStyle(
                      color: Color.fromARGB(225, 88, 88, 88),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                const Text(
                  "\$",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Delivery Price : ",
                  style: TextStyle(
                      color: Color.fromARGB(223, 31, 31, 31),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  "${listdata.ordersPricedelivery}",
                  style: const TextStyle(
                      color: Color.fromARGB(225, 88, 88, 88),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                const Text(
                  "\$",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Payment Method : ",
                  style: TextStyle(
                      color: Color.fromARGB(223, 31, 31, 31),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  controller
                      .printPaymentMethod(listdata.ordersPayment.toString()),
                  style: const TextStyle(
                      color: Color.fromARGB(225, 88, 88, 88),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Order Status : ",
                  style: TextStyle(
                      color: Color.fromARGB(223, 31, 31, 31),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  controller.printOrderStatus(listdata.ordersStutes.toString()),
                  style: const TextStyle(
                      color: Color.fromARGB(225, 88, 88, 88),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Row(
                  children: [
                    const Text(
                      "Total Price : ",
                      style: TextStyle(
                          color: colorApp.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      "${listdata.ordersTotelprice}",
                      style: const TextStyle(
                          color: Color.fromARGB(225, 88, 88, 88),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    const Text(
                      "\$",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  color: colorApp.orange,
                  textColor: colorApp.greyopane,
                  child: const Text("Details"),
                ),
                SizedBox(
                  width: 10,
                ),
                if (listdata.ordersStutes == 0)
                  MaterialButton(
                    onPressed: () {
                      controller.deleteData(listdata.ordersId.toString());
                    },
                    color: colorApp.orange,
                    textColor: colorApp.greyopane,
                    child: const Text("Delete"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
