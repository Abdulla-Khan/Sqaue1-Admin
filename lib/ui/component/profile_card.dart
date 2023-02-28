import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:squareone_admin/ui/component/colors.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({
    Key? key,
    required this.text,
    required this.imgUrl,
    required this.function,
    this.width = 30,
    this.png = false,
    required this.height,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;
  final String imgUrl;
  final bool png;

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        width: width / 1,
        height: height / 8.5,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: redColor,
                          borderRadius: BorderRadius.circular(12)),
                      width: 48,
                      height: 48,
                      child: Center(
                          child: SizedBox(
                        width: 25,
                        height: 25,
                        child: png
                            ? Image.asset(imgUrl)
                            : SvgPicture.asset(imgUrl),
                      )),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios_sharp)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
