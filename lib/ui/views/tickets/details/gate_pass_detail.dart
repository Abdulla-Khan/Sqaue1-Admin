import 'package:flutter/material.dart';
import '../../../component/buttons.dart';

class GateInwardDetails extends StatelessWidget {
  const GateInwardDetails(
      {super.key,
      required this.particular,
      required this.type,
      required this.unit,
      required this.poc,
      required this.quantity,
      required this.vehicle,
      required this.registeration,
      required this.contact,
      required this.time,
      required this.date,
      required this.workers,
      required this.outlet,
      required this.status});

  final String particular;
  final String type;
  final String unit;
  final String poc;
  final String quantity;
  final String vehicle;
  final String registeration;
  final String contact;
  final String time;
  final String date;
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
          height: height / 1,
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
                      const Text(
                        'Ticket For Gate Pass Inwards',
                        style: TextStyle(
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
                  ticektDetailText(head: 'Particular', text: particular),
                  ticektDetailText(head: 'Type', text: type),
                  ticektDetailText(head: 'Unit', text: unit),
                  ticektDetailText(head: 'POC', text: poc),
                  ticektDetailText(head: 'Quantity', text: quantity),
                  ticektDetailText(head: 'Vehicle', text: vehicle),
                  ticektDetailText(head: 'Registeration', text: registeration),
                  ticektDetailText(head: 'Contact', text: contact),
                  showWorkers(head: 'Workers', text: workers),
                  ticektDetailText(head: 'Time', text: time),
                  ticektDetailText(head: 'Date', text: date),
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

RichText showWorkers({String? head, List? text}) {
  return RichText(
    text: TextSpan(
        text: "\n$head : ",
        style: const TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
        children: [
          for (var i in text!)
            TextSpan(
              text: "$i,",
              style: const TextStyle(
                  color: Color(0xFF858597),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500),
            )
        ]),
  );
}
