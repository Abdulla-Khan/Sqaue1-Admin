import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  GetStorage storage = GetStorage();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxInt index = 2.obs;
  String email = '';
  @override
  void onInit() {
    email = storage.read('email');
    firebaseFirestore
        .collection('Depart Members')
        .doc(email)
        .get()
        .then((value) {
      switch (value.data()!['Department']) {
        case 'Security':
        case 'Maintainance':
          index.value = 2;
          break;
        case 'Operations':
        case 'Admin':
          index.value = 4;
      }
    });
    super.onInit();
  }
}
