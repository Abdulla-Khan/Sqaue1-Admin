import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:squareone_admin/ui/component/colors.dart';
import 'package:squareone_admin/ui/component/profile_Card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: width,
              height: height / 4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/home/DSC_8735.png'),
                      fit: BoxFit.cover)),
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image:
                                AssetImage('assets/profile/profile_person.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Abdullah',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Text(
                              'Admin',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: height * 0.2,
          child: Container(
            width: width,
            height: height / 1.1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 23),
                  child: const Text(
                    ' My Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                ListView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, right: 12, left: 12),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: profileImg.length,
                    itemBuilder: (context, index) {
                      return ProfileCards(
                          height: height,
                          width: width,
                          text: profileText[index],
                          imgUrl: profileImg[index],
                          function: () {});
                    }),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
