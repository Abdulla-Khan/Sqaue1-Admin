import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../auth/auth_view.dart';
import '../home/admin/admin_home_view.dart';
import '../home/maintainance/maintainance_home_view.dart';
 import '../home/security/security_home_view.dart';
 
class SplashController extends GetxController {
  RxBool isloadin = false.obs;

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      getData();
    });
    initInfo();
    request();
    super.onInit();
  }

  GetStorage storage = GetStorage();

  getData() {
    var email = storage.read('email');
    var password = storage.read('password');

    if (email == null && password == null) {
      Get.offAll(() => const LoginView());
    } else {
      isloadin.value = true;
      try {
        isloadin.value = true;

        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty) {
          routeToHome(email);
        }
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        Get.offAll(() => const LoginView());
      }
    }
  }

  routeToHome(String email) {
    FirebaseFirestore.instance
        .collection('Depart Members')
        .doc(email)
        .get()
        .then((value) {
      switch (value.data()!['Department']) {
        case 'Security':
          Get.offAll(() => const SecurityHomeView());

          break;
        case 'Maintainance':
          Get.offAll(() => const MaintainanceHomeView());

          break;
        case 'Operations':
          Get.offAll(() => const AdminHomeView());
          break;
        case 'Admin':
          Get.offAll(() => const AdminHomeView());
          break;
      }
    });
  }
  initInfo() {
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initialSetting = InitializationSettings(android: android);
    _notificationsPlugin.initialize(
      initialSetting,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      AndroidNotificationDetails androidNotificationDetails =
          const AndroidNotificationDetails('tttt', 'tttt', '',
              importance: Importance.max,
              priority: Priority.max,
              playSound: false);

      NotificationDetails details =
          NotificationDetails(android: androidNotificationDetails);
      await _notificationsPlugin.show(0, message.notification?.title.toString(),
          message.notification?.body.toString(), details,
          payload: message.data['title']);
    });
  }

  void request() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {}
  }
}
