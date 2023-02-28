import 'package:flutter/material.dart';

import '../../../component/buttons.dart';
import 'gate_pass_detail.dart';

class SecurityTicektDetails extends StatelessWidget {
  const SecurityTicektDetails(
      {super.key,
      required this.activity,
      required this.dateOfActivity,
      required this.duration,
      required this.overNight,
      required this.services,
      required this.timeOfActivity,
      required this.workers,
      required this.outlet,
      required this.status,
      required this.head});
  final String head;
  final String activity;
  final String dateOfActivity;
  final String duration;
  final String overNight;
  final String services;
  final String timeOfActivity;
  final List workers;
  final String outlet;
  final bool status;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: ButtonBack(
          height: height,
          width: width,
        ),
        title: const Text(
          'Ticket Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width,
          height: height / 1.9,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ticket For $head',
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      CircleAvatar(
                          backgroundColor: status
                              ? const Color(0xFFFE0D0D)
                              : const Color(0xFF12CA37),
                          radius: width * 0.028,
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: width * 0.021,
                              child: CircleAvatar(
                                backgroundColor: status
                                    ? const Color(0xFFFE0D0D)
                                    : const Color(0xFF12CA37),
                                radius: width * 0.017,
                              )))
                    ],
                  ),
                  ticektDetailText(head: 'Activity Type', text: activity),
                  ticektDetailText(
                      head: 'Date of Activity', text: dateOfActivity),
                  ticektDetailText(head: 'Duration', text: duration),
                  ticektDetailText(head: 'Over Night', text: overNight),
                  ticektDetailText(head: 'Services', text: services),
                  ticektDetailText(
                      head: 'Time of Activity', text: timeOfActivity),
                  showWorkers(head: 'Workers', text: workers),
                  ticektDetailText(head: 'Outlet Name', text: outlet),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText ticektDetailText({String? head, String? text}) {
    return RichText(
      text: TextSpan(
          text: "\n$head : ",
          style: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                  color: Color(0xFF858597),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
