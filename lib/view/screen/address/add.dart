import 'package:ecommercee/controller/addresscontroller/addcontroller.dart';
import 'package:ecommercee/core/class/handlingdataview.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/function/valedthion.dart';
import 'package:ecommercee/view/widget/auth/bouttonauth.dart';
import 'package:ecommercee/view/widget/auth/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controller = Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add address",
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
        body: GetBuilder<AddAddressController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Column(
                    children: [
                      Container(
                        height: 400,
                        child: Form(
                          key: controller.signupkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextForm(
                                  onsaved: (val) {
                                    controller.name = val;
                                  },
                                  hintText: 'Name of Address',
                                  isNum: false,
                                  label: 'Name',
                                  suffixIcon: Icons.edit_note_sharp,
                                  valed: (val) {
                                    return validInput(val!, 4, 15, "namee");
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              TextForm(
                                onsaved: (val) {
                                  controller.city = val;
                                },
                                hintText: 'City',
                                isNum: false,
                                label: 'city',
                                suffixIcon: Icons.location_on_outlined,
                                valed: (val) {
                                  return validInput(val!, 4, 15, "cityy");
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextForm(
                                onsaved: (val) {
                                  controller.street = val;
                                },
                                hintText: 'Street',
                                isNum: false,
                                label: 'street',
                                suffixIcon: Icons.home_outlined,
                                valed: (val) {
                                  return validInput(val!, 4, 50, "streete");
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      ButtonAuth(
                        onPressed: () {
                          controller.addbutton();
                          print(controller.name);
                        },
                        child: "Add",
                      )
                    ],
                  ),
                )));
  }
}
