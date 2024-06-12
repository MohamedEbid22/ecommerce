import 'package:ecommercee/controller/addresscontroller/viewcontroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorApp.orange,
                Color.fromARGB(241, 255, 153, 0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressadd);
        },
        backgroundColor:
            Colors.transparent, // Set background color as transparent
        elevation: 0, // Remove elevation shadow if needed
        highlightElevation: 0, // Remove elevation shadow when pressed if needed
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30), // Adjust the border radius as needed
        ),
        // Wrap with a container to apply the gradient background
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorApp.orange,
                Color.fromARGB(241, 255, 153, 0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(
                30), // Adjust the border radius to match the shape
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 29,
          ),
        ),
      ),
      body: GetBuilder<ViewAddressController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return cardaddress(
                      addressModel: controller.data[i],
                      onDelet: () {
                        controller.deletedata(
                            "${controller.data[i].addressId!.toString()}");
                      },
                    );
                  }))),
    );
  }
}

class cardaddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelet;
  const cardaddress(
      {super.key, required this.addressModel, required this.onDelet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 5, top: 5, bottom: 5),
        child: ListTile(
          title: Text("${addressModel.addressName}"),
          subtitle: Text("${addressModel.addressCity} " +
              " :  " +
              "${addressModel.addressStreet}"),
          trailing: IconButton(
              onPressed: onDelet,
              icon: Icon(
                Icons.delete_outline_outlined,
                color: Color.fromARGB(225, 93, 93, 93),
              )),
        ),
      ),
    );
  }
}
