import 'package:ecommercee/core/constant/color.dart';
import 'package:ecommercee/core/localization/changelocal.dart';
import 'package:ecommercee/core/localization/translation.dart';
import 'package:ecommercee/core/servicies/servicies.dart';
import 'package:ecommercee/routes.dart';
import 'package:ecommercee/tast.dart';
import 'package:ecommercee/view/screen/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: colorApp.orange,
              fontWeight: FontWeight.bold,
              fontSize: 29),
          bodyLarge: TextStyle(fontSize: 18, color: colorApp.grey, height: 1.6),
        ),
      ),
      translations: MyTranslation(),
      locale: controller.langage,

      // routes: routes,
      getPages: routes,
    );
  }
}
