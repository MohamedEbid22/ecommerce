import 'package:ecommercee/controller/homescreen_controller.dart';
import 'package:ecommercee/core/constant/approutes.dart';
import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/view/widget/home/custem_boutenbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: colorApp.orange,
              onPressed: () {},
              child: MaterialButton(
                onPressed: () {
                  Get.offNamed(AppRoutes.CartPage);
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              height: 55,
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Custem_ButtonNavBar(
                          onPressed: () {
                            controller.changepage(0);
                          },
                          active: controller.cuntpage == 0 ? true : false,
                          icon: Icons.home_outlined,
                          color: colorApp.grey,
                        ),
                        Custem_ButtonNavBar(
                          onPressed: () {
                            controller.changepage(2);
                          },
                          active: controller.cuntpage == 2 ? true : false,
                          icon: Icons.person_outline_outlined,
                          color: colorApp.grey,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Custem_ButtonNavBar(
                          onPressed: () {
                            controller.changepage(3);
                          },
                          active: controller.cuntpage == 3 ? true : false,
                          icon: Icons.favorite_outline_sharp,
                          color: colorApp.grey,
                        ),
                        Custem_ButtonNavBar(
                          onPressed: () {
                            controller.changepage(1);
                          },
                          active: controller.cuntpage == 1 ? true : false,
                          icon: Icons.settings_outlined,
                          color: colorApp.grey,
                        ),
                      ],
                    )
                  ],
                ),
              )),
          body: controller.listpage.elementAt(controller.cuntpage)),
    );
  }
}
