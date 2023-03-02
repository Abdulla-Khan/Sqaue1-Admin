import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../component/colors.dart';

// import 'package:square1_user/ui/constants/constants.dart';

class SecurityHomeView extends StatelessWidget {
  const SecurityHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetX<SecurityHomeController>(
            init: Get.put<SecurityHomeController>(SecurityHomeController()),
            builder: (controller) => maintainancePages[controller.index.value]),
        bottomNavigationBar: GetX<SecurityHomeController>(
            init: Get.put<SecurityHomeController>(SecurityHomeController()),
            builder: (controller) => SalomonBottomBar(
                  selectedItemColor: const Color.fromARGB(255, 23, 35, 44),
                  items: maintainanceItems,
                  currentIndex: controller.index.value,
                  onTap: (i) => controller.indexChange(i),
                )));
  }
}

class SecurityHomeController extends GetxController {
  RxInt index = 0.obs;
  void indexChange(int i) {
    index.value = i;
  }
}
