import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareone_admin/ui/component/notification_approve_tile.dart';
import 'package:squareone_admin/ui/component/notification_tile.dart';
import 'package:squareone_admin/ui/views/forms/add_notification/add_notification_view.dart';
import 'package:squareone_admin/ui/views/notifications/notifications_controller.dart';

import '../../component/buttons.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              width: width,
              height: height * 0.11,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('   Create Notification',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                        onTap: () => Get.to(() => const AddNotification()),
                        child: AddButton(
                          height: height,
                          width: width,
                        ))
                  ],
                ),
              ),
            ),
          ),
          GetX<NotificationController>(
              init: Get.put<NotificationController>(NotificationController()),
              builder: (controller) {
                switch (controller.permission.value) {
                  case "Operations":
                  case "Admin":
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '\n     Pending Notifications',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: height / 1.7,
                            width: width,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('Approval-Notification').snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {



                                return 
                                !asyncSnapshot.hasData ? const Center(
                                  child: CircularProgressIndicator(),
                                ):
                                
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: asyncSnapshot.data!.docs.length,
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index)  {
                                   final Timestamp timestamp =
                          asyncSnapshot.data!.docs[index]['time'] as Timestamp;
                      final DateTime dateTime = timestamp.toDate();
                                   
                                   return   ApproveNotificationTile(
                                   width: width,
                        height: height,
                        text: asyncSnapshot.data!.docs[index]['subject'],
                        date:
                            '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
                                  );}
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    );
                  case "Maintainance":
                  case "Security":
                    return Column(
                      
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     const    Text(
                          '\n     Sent Notifications',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                           height: height / 1.7,
                            width: width,
                          child: StreamBuilder(
                                  stream:
                                      FirebaseFirestore.instance.collection('Notification').snapshots(),
                                  builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                                    return !asyncSnapshot.hasData
                                        ? const Center(child: CircularProgressIndicator())
                                        : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: asyncSnapshot.data!.docs.length,
                                            padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              final Timestamp timestamp =
                            asyncSnapshot.data!.docs[index]['time'] as Timestamp;
                                              final DateTime dateTime = timestamp.toDate();
                                              //  ));
                        
                                              return NotificationsTile(
                          width: width,
                          height: height,
                          text: asyncSnapshot.data!.docs[index]['subject'],
                          date:
                              '${dateTime.hour}:${dateTime.minute}:${dateTime.second}',
                                              );
                                            });
                                  }),
                        ),
                      ],
                    );
                  default:
                    return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}