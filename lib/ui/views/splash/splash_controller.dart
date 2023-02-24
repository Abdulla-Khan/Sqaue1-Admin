import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squareone_admin/ui/views/home/home_view.dart';

import '../auth/auth_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }

  GetStorage storage = GetStorage();

  getData() async {
    var data = await storage.read('admin');

    data == true
        ? Get.offAll(() => const HomeView())
        : Get.offAll(() => const LoginView());
  }
}
