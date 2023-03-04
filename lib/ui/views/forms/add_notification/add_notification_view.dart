import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareone_admin/ui/component/buttons.dart';
import 'package:squareone_admin/ui/component/colors.dart';

import '../../../component/text_feilds.dart';
import 'add_notifications_controller.dart';

class AddNotification extends StatelessWidget {
  const AddNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: width,
                  height: height / 4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/home/DSC_8735.png'),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '\n   Notifications',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            Text(
                              '      Custom Notifications for Client App',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(child: Container(color: Colors.white)),
              ],
            ),
            Positioned(
              top: height * 0.2,
              child: Container(
                width: width,
                height: height / 1.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Colors.white,
                ),
                child: GetBuilder<AddNotificationsController>(
                    init: Get.put<AddNotificationsController>(
                        AddNotificationsController()),
                    builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(height: height * 0.02),
                          textFeild(
                            'Subject',
                            controller.titleController,
                          ),
                          descFeild(
                            'Description',
                            maxLines: 5,
                            controller.bodyController,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 24, right: 24, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => controller.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: redColor,
                                        )
                                      : LoginButton(
                                          width: width,
                                          height: height,
                                          function: () =>
                                              controller.sendNotifications(),
                                          text: 'Submit',
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
