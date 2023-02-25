import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareone_admin/ui/views/home/home_view.dart';

import '../../../component/dialog.dart';

class AddDepartmentController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<DropdownMenuItem<String>> get outletItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Maintainance", child: Text("Maintainance")),
      const DropdownMenuItem(value: "Security", child: Text("Security")),
      const DropdownMenuItem(value: "Operations", child: Text("Operations")),
    ];
    return menuItems;
  }

  String? selectedOutlet;

  addDepart() {
    if (nameController.text.isNotEmpty &
        contactController.text.isNotEmpty &
        emailController.text.isNotEmpty &
        passwordController.text.isNotEmpty) {
      isLoading.value = true;
      return firebaseFirestore.collection('Depart Members').add({
        'Outlet Name': nameController.text.trim(),
        'Contact Number': contactController.text.trim(),
        'Email': emailController.text.trim(),
        'Password': passwordController.text.trim(),
        "Department": selectedOutlet,
      }).whenComplete(() {
        try {
          auth
              .createUserWithEmailAndPassword(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim())
              .whenComplete(() {
            isLoading.value = false;
            contactController.clear();
            emailController.clear();
            passwordController.clear();
            getDialog(
                    title: 'Success',
                    desc: 'Your Ticket Has Been Created Successfully'
                        'You Will be Contacted Soon.')
                .then((value) => Get.offAll(() => const HomeView()));
          });
        } on FirebaseException catch (e) {
          Get.snackbar('Operation Failed', '');
          isLoading.value = false;
        }
      });
    }
  }
}
