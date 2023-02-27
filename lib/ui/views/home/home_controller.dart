import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    getName();
  }

  getName() {
    firebaseFirestore
        .collection('Depart Members')
        .doc(auth.currentUser!.email)
        .get()
        .then((value) {
      name.value = value.data()!['Name'];
    });
  }
}
