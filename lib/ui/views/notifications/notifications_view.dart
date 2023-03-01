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
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  ApproveNotificationTile(
                                width: width,
                                height: height,
                                text: 'Hemllo',
                                date: "Just Now",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  case "Maintainance":
                  case "Security":
                    return const Text(
                      '\n     Sent Notifications',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.right,
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
