import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squareone_admin/ui/component/dialog.dart';

import '../forms/add_notification/add_notifications_controller.dart';

class TicketController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxString depart = ''.obs;

  GetStorage storage = GetStorage();
  String email = '';
  @override
  void onReady() {
    email = storage.read('email');
    getDepart(email);
  }

  getDepart(email) async {
    await firebaseFirestore
        .collection('Depart Members')
        .doc(email)
        .get()
        .then((value) => depart.value = value.data()!['Department']);
  }

  closeTicket(uid, ticketId, header) {
    firebaseFirestore
        .collection('Tickets')
        .doc(ticketId)
        .update({'Status': false}).whenComplete(() {
      firebaseFirestore
          .collection('Outlets')
          .where('uid', isEqualTo: uid)
          .get()
          .then((value) {
        for (int i = 0; i < value.docs.length; i++) {
          var a = value.docs[i];
          sendMessage(a.get('token'), '$header  Closed',
                  'Your ticket has been closed.')
              .whenComplete(() => getDialog(
                  title: 'Success', desc: 'Ticket Closed Successfully'));
        }
      });
    });
  }
}
