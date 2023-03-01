import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../auth/auth_view.dart';
import '../home/admin/admin_home_view.dart';
import '../home/maintainance/maintainance_home_view.dart';
import '../home/security/security_home_view.dart';

class SplashController extends GetxController {
  RxBool isloadin = false.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      getData();
    });
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
          Get.offAll(() => const AdminHomeView());
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
}
