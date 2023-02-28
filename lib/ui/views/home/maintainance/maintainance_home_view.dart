import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../component/colors.dart';

// import 'package:square1_user/ui/constants/constants.dart';

class MaintainanceHomeView extends StatelessWidget {
  const MaintainanceHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<MaintainanceHomeController>(
            init: Get.put<MaintainanceHomeController>(
                MaintainanceHomeController()),
            builder: (controller) => maintainancePages[controller.index.value]),
        bottomNavigationBar: GetX<MaintainanceHomeController>(
            init: Get.put<MaintainanceHomeController>(
                MaintainanceHomeController()),
            builder: (controller) => SalomonBottomBar(
                  selectedItemColor: const Color.fromARGB(255, 23, 35, 44),
                  items: maintainanceItems,
                  currentIndex: controller.index.value,
                  onTap: (i) => controller.indexChange(i),
                )));
  }
}

class MaintainanceHomeController extends GetxController {
  RxInt index = 0.obs;
  void indexChange(int i) {
    index.value = i;
  }
}
