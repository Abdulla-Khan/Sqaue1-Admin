import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../component/buttons.dart';

import '../tickets_controller.dart';
import 'gate_pass_detail.dart';

class NonRentalActivity extends StatelessWidget {
  const NonRentalActivity({
    super.key,
    required this.activity,
    required this.duration,
    required this.overNight,
    required this.timeOfActivity,
    required this.workers,
    required this.outlet,
    required this.status,
    required this.dateOfActivityFrom,
    required this.dateOfActivityTo,
    this.comments,
    required this.uid,
    required this.ticketId,
    required this.showButton,
  });
  final bool showButton;

  final String activity;
  final String dateOfActivityFrom;
  final String dateOfActivityTo;
  final String? comments;
  final String duration;
  final String overNight;
  final String timeOfActivity;
  final List workers;
  final String outlet;
  final bool status;
  final String uid;
  final String ticketId;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: width,
                height: height / 2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
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
                            const Text(
                              'Ticket For Non Rental Hour Activity',
                              style: TextStyle(
                                fontSize: 18,
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
                            head: 'Date of Activity From',
                            text: dateOfActivityFrom),
                        ticektDetailText(
                            head: 'Date of Activity To',
                            text: dateOfActivityTo),
                        comments == null
                            ? ticektDetailText(head: 'Comments', text: duration)
                            : const SizedBox(height: 0),
                        ticektDetailText(head: 'Over Night', text: overNight),
                        ticektDetailText(
                            head: 'Time of Activity', text: timeOfActivity),
                        showWorkers(head: 'Workers', text: workers),
                        ticektDetailText(head: 'Outlet Name', text: outlet),
                      ],
                    ),
                  ),
                ),
              ),
              showButton
                  ? GetBuilder<TicketController>(
                      init: Get.put<TicketController>(TicketController()),
                      builder: (controller) {
                        return LoginButton(
                          width: width,
                          height: height,
                          function: () => controller.closeTicket(uid, ticketId,
                              'Ticket For Non Rental Hour Activity'),
                          text: 'Close Ticket',
                        );
                      })
                  : const SizedBox(height: 0),
            ],
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
