import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../component/colors.dart';

// import 'package:square1_user/ui/constants/constants.dart';

class AdminHomeView extends StatelessWidget {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<AdminHomeController>(
            init: Get.put<AdminHomeController>(AdminHomeController()),
            builder: (controller) => adminPages[controller.index.value]),
        bottomNavigationBar: GetX<AdminHomeController>(
            init: Get.put<AdminHomeController>(AdminHomeController()),
            builder: (controller) => SalomonBottomBar(
                  selectedItemColor: const Color.fromARGB(255, 23, 35, 44),
                  items: adminItems,
                  currentIndex: controller.index.value,
                  onTap: (i) => controller.indexChange(i),
                )));
  }
}

class AdminHomeController extends GetxController {
  RxInt index = 0.obs;
  void indexChange(int i) {
    index.value = i;
  }
}
