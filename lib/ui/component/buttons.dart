import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      this.text = 'Log In',
      required this.width,
      required this.height,
      required this.function})
      : super(key: key);

  final double width;
  final double height;
  final void Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: function,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            vertical: width / 20,
          ),
          width: width / 2.5,
          height: height / 17,
          decoration: BoxDecoration(
              color: redColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17))),
        ),
      ),
    );
  }
}

class TicketButton extends StatelessWidget {
  const TicketButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: redColor, borderRadius: BorderRadius.circular(12)),
        width: 48,
        height: 48,
        child: Center(
          child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/home/ticket.svg')),
        ));
  }
}

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: redColor, borderRadius: BorderRadius.circular(12)),
        width: 48,
        height: 48,
        child: const Center(
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 25,
          ),
        ));
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class WorkerButton extends StatelessWidget {
  const WorkerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: redColor, borderRadius: BorderRadius.circular(12)),
        width: 48,
        height: 48,
        child: Center(child: SvgPicture.asset('assets/profile/profile_1.svg')));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: redColor, borderRadius: BorderRadius.circular(12)),
      width: 42,
      height: 42,
      child: const Center(
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
