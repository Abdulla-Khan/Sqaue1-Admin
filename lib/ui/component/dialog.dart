import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

Future<dynamic> getDialog(
    {required String title,
    required String desc,
    IconData icon = Icons.check_sharp}) {
  return Get.defaultDialog(
    radius: 12,
    title: '',
    titleStyle: const TextStyle(fontSize: 0),
    content: Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: redColor,
            radius: 40,
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
