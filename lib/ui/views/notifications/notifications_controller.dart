import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxString permission = ''.obs;

  @override
  void onReady() {
    getNotifications();
  }

  getNotifications() {
    firebaseFirestore
        .collection('Depart Members')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) {
      permission.value = value.data()!['Department'];
    });
  }
}
