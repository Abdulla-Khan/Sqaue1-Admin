import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squareone_admin/ui/views/home/maintainance/maintainance_view.dart';
import 'package:squareone_admin/ui/views/home/security/security_view.dart';

import '../home/home_view.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage storage = GetStorage();
  RxBool isloading = false.obs;
  void saveDataLocal() {
    storage.write('email', emailController.text);
    storage.write('password', passwordController.text);
  }

  void login() async {
    isloading.value = true;
    if (emailController.text.isNotEmpty & passwordController.text.isNotEmpty) {
      try {
        await auth.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.trim());
        if (auth.currentUser!.uid.isNotEmpty) {
          await FirebaseMessaging.instance.getToken().then((value) {
            firebaseFirestore
                .collection('Depart Members')
                .doc(emailController.text)
                .update({
              'token': value,
            }).whenComplete(() {
              routeToHome();
              isloading.value = false;
            });
          });
          saveDataLocal();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            'Login Failed',
            'No User with that Email',
          );
          isloading.value = false;
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            'Login Failed',
            'Wrong password provided for that user.',
          );
          isloading.value = false;
        }
      }
    }
  }

  routeToHome() {
    firebaseFirestore
        .collection('Depart Members')
        .doc(emailController.text)
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
          Get.offAll(() => const HomeView());
          break;
        case 'Admin':
          Get.offAll(() => const HomeView());
          break;
        // break;
      }
    });
  }
}
