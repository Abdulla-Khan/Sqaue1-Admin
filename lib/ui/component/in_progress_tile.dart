import 'package:flutter/material.dart'; 

import 'buttons.dart';
import 'colors.dart';

class InProgressTicketTile extends StatelessWidget {
  const InProgressTicketTile({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.header,
    required this.headerText,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final String header;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width / 1.1,
      height: height / 6.8,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const TicketButton(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: Text(
                          text,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            header,
                            style: const TextStyle(color: Color(0xFFB8B8D2)),
                          ),
                          Text(
                            headerText,
                            style: const TextStyle(color: Color(0xFFB8B8D2)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: 80,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: bgRedColor, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Pending',
                  style: TextStyle(color: textRedColor, fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
