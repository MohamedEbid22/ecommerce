import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  print("+++++++++hai =======================================================");
  FirebaseMessaging.onMessage.listen((message) {
    print("================== Notification =================");
    print(message.notification!.title);
    print(message.notification!.body);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
