import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddNotificationsController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  GetStorage storage = GetStorage();
  String email = '';
  @override
  void onReady() {
    email = storage.read('email');
  }

  sendNotifications() async {
    CollectionReference approvalNotification =
        FirebaseFirestore.instance.collection('Approval-Notification');

    CollectionReference notification =
        FirebaseFirestore.instance.collection('Notification');

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Outlets").get();
    firebaseFirestore
        .collection('Depart Members')
        .doc(email)
        .get()
        .then((value) async {
      switch (value.data()!['Department']) {
        case 'Admin':
        case "Operations":
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            var a = querySnapshot.docs[i];
            await notification.add({
              'subject': titleController.text,
              'description': bodyController.text,
              'time': DateTime.now(),
            });
            sendMessage(
                a.get('token'), bodyController.text, titleController.text);
          }
          break;
        case "Maintainance":
        case "Security":
          await approvalNotification.add({
            'subject': titleController.text,
            'description': bodyController.text,
            'time': DateTime.now(),
          });
      }
    });
  }
}

Future sendMessage(
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
