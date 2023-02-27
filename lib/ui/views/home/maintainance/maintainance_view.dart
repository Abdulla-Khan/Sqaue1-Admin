import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareone_admin/ui/views/forms/add_depart_member/add_depart_member_view.dart';
import 'package:squareone_admin/ui/views/forms/add_outlet/add_outlet_view.dart';

import '../../../component/buttons.dart';
import '../../../component/colors.dart';
import '../../../component/department_tile.dart';

class MaintainanceHomeView extends StatelessWidget {
  const MaintainanceHomeView({super.key});

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
            alignment: const Alignment(0, 0.6),
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
                        EdgeInsets.only(top: height * 0.23, left: width * 0.06),
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
                              horizontal: 21, vertical: 12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemCount: maintainanceCardTitle.length,
                          itemBuilder: (context, index) {
                            return DepartmentTile(
                              width: width,
                              height: height,
                              title: maintainanceCardTitle[index],
                              imgUrl: maintainanceCardImages[index],
                              header: maintainanceCardHeaders[index],
                            );  
                          }))
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.6),
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.11,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('   Add Outlet',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                        onTap: () => Get.to(() => const AddOutletView()),
                        child: AddButton(
                          height: height,
                          width: width,
                        ))
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.3),
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.11,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('   Add Department',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    GestureDetector(
                        onTap: () => Get.to(() => const AddDepartmentView()),
                        child: AddButton(
                          height: height,
                          width: width,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
