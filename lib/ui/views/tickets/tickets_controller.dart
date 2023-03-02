import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../forms/add_notification/add_notifications_controller.dart';

class TicketController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  closeTicket(uid, ticketId) {
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
          sendMessage(a.get('token'), 'Ticket Closed', '');
        }
      });
    });
  }
}
