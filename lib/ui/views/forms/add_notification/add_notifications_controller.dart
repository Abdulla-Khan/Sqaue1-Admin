import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddNotificationsController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  sendNotifications() async {
    CollectionReference notification =
        FirebaseFirestore.instance.collection('notification');
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("users").get();
    firebaseFirestore
        .collection('Depart Members')
        .doc('admin@gmail.com')
        .get()
        .then((value) async {
      switch (value.data()!['Department']) {
        case 'Admin':
        case "Operations":
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            var a = querySnapshot.docs[i];
            // print(a.get('token'));
            sendMessage(
                a.get('token'), bodyController.text, titleController.text);
          }
          break;
        default:
          await notification.add({
            'subject': titleController.text,
            'description': bodyController.text,
            'time': DateTime.now(),
          });
      }

      // if( == )
    });
  }

  static Future sendMessage(
    token,
    String body,
    String title,
  ) async {
    try {
      await http
          .post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAAkgzIM_w:APA91bEghe1p0x4SW_1lqwYr74-mOFpxpzyfPAYMSCH2MzEXEdjn8Fxp1rNbAUZclUgxgkdtzkOAjAyB_z9uK-aoP75GaI8PsIFqp7Z9GIWIjZMU_EU7ubDvE0K_1HZNg24f9VcdWZYv',
              },
              body: jsonEncode(<String, dynamic>{
                'priority': 'high',
                'data': <String, dynamic>{
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                  'status': 'done',
                  'body': body,
                  'title': title,
                },
                'notification': <String, dynamic>{
                  'title': title,
                  'body': body,
                  "android_channel_id": 'tttt'
                },
                "to": token
              }))
          .whenComplete(() => log('sucess'));
    } catch (e) {
      // ScaffoldMessenger.of(context)
      // .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
