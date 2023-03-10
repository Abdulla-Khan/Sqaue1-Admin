import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../component/dialog.dart';
import '../../home/admin/admin_home_view.dart';

class AddOutletController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameControler = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pocController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  addOutlet() {
    if (nameControler.text.isNotEmpty &
        nameControler.text.isNotEmpty &
        pocController.text.isNotEmpty &
        contactController.text.isNotEmpty &
        emailController.text.isNotEmpty &
        passwordController.text.isNotEmpty) {
      isLoading.value = true;
      try {
        auth
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim())
            .whenComplete(() => firebaseFirestore
                    .collection('Outlets')
                    .doc(emailController.text)
                    .set({
                  'Outlet Name': nameControler.text.trim(),
                  'Outlet Number': numberController.text.trim(),
                  'POC': pocController.text.trim(),
                  'Contact Number': contactController.text.trim(),
                  'Email': emailController.text.trim(),
                  'Password': passwordController.text.trim(),
                }).whenComplete(() {
                  isLoading.value = false;
                  nameControler.clear();
                  contactController.clear();
                  pocController.clear();
                  emailController.clear();
                  passwordController.clear();
                  numberController.clear();
                  getDialog(
                          title: 'Success', desc: 'Outlet Added Successfully.')
                      .then((value) => Get.offAll(() => const AdminHomeView()));
                }));
      } on FirebaseException catch (e) {
        isLoading.value = false;
        log(e.toString());
        Get.snackbar('Operation Failed', '');
      }
    }
  }
}
