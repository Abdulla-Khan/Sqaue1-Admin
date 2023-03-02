import 'package:flutter/material.dart';

import 'buttons.dart';

class ApproveNotificationTile extends StatelessWidget {
  const ApproveNotificationTile({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.date,
  }) : super(key: key);

  final double width;
  final double height;
  final String? text;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width / 1.1,
      height: height / 7.1,
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
                  const NotificationsButton(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.6,
                        child: Text(
                          text!,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch,
                            color: Color(0xFFB8B8D2),
                            size: 12,
                          ),
                          Text(
                            date!.toString(),
                            style: const TextStyle(color: Color(0xFFB8B8D2)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('approve');
                    },
                    child: const Text(
                      'Approve      ',
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('delcone');
                    },
                    child: const Text(
                      'Decline',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
