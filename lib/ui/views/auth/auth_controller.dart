import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squareone_admin/ui/views/home/home_view.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GetStorage storage = GetStorage();
  String token = '';
  RxBool isloading = false.obs;

  getToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      token = value!;
    });
  }

  void login() async {
    isloading.value = true;
    if (emailController.text.trim() == 'admin@gmail.com' &&
        passwordController.text.trim() == 'admin') {
      Get.offAll(() => const HomeView());
    }
    isloading.value = false;
  }

  void saveDataLocal(String uid) {
    storage.write('admin', true);
  }
}
