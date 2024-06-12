import 'package:ecommercee/controller/settingpage_contrroller.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingPageController controller = Get.put(SettingPageController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp.orange,
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: Get.width / 1,
                  height: Get.width / 4,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        colorApp.orange,
                        Color.fromARGB(241, 255, 153, 0)
                      ])),
                ),
                Positioned(
                    top: Get.width / 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/3.jpeg'),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text("Disabel Notification"),
                    trailing: Container(
                      width: 20,
                      child: Transform.scale(
                        scale: .8,
                        child: Switch(
                          activeColor: colorApp
                              .orange, // Set the color for the "on" state

                          onChanged: (Value) {},
                          value: true,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.addressview);
                    },
                    title: const Text("Adderss"),
                    trailing: const Icon(Icons.location_on_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.OrderPanding);
                    },
                    title: const Text("Orders"),
                    trailing: const Icon(Icons.shopping_cart_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.OrderArchive);
                    },
                    title: const Text("Archef"),
                    trailing: const Icon(Icons.remove_shopping_cart),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Aboute Us"),
                    trailing: const Icon(Icons.help_outline_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text("Contact Us"),
                    trailing: Icon(Icons.phone_callback_outlined),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: const Text("Loge out"),
                    trailing: const Icon(Icons.logout_outlined),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
