import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class DepartmentTile extends StatelessWidget {
  const DepartmentTile({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.imgUrl,
  });

  final double width;
  final String title;
  final String imgUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width / 2.22,
      height: height / 4.5,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(''),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: height * 0.02,
                    backgroundColor: redColor,
                    child: SizedBox(
                      width: height * 0.02,
                      height: height * 0.02,
                      child: SvgPicture.asset(
                        imgUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    width: width * 0.25,
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '     Total Active Tickets',
                style: TextStyle(
                  color: greyTextColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '   2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}
