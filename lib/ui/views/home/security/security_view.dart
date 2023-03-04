import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/colors.dart';
import '../../../component/department_tile.dart';
import '../../tickets/tickets_view.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
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
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Hi Abdullah! Welcome to Square1 ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 280,
                        child: Text(
                          '"Where Technology Meets Convenience '
                          'One Call Away from All Your Problems."',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.white,
              ),
              width: width,
              height: height / 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: height * 0.03, left: width * 0.06),
                    child: const Text(
                      ' Total Departments',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 21,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => TicketsView(), arguments: [
                                  securityCardTitle[index],
                                  securityCardHeaders[index]
                                ]);
                              },
                              child: DepartmentTile(
                                width: width,
                                height: height,
                                title: securityCardTitle[index],
                                imgUrl: securityCardImages[index],
                                header: securityCardHeaders[index],
                              ),
                            );
                          }))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
