import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squareone_admin/ui/component/in_progress_tile.dart';

import '../../component/buttons.dart';
import '../../component/colors.dart';
import 'details/gate_pass_detail.dart';
import 'details/non_rental_activity.dart';
import 'details/security.dart';
import 'details/store_renovation_detail.dart';

class TicketsView extends StatelessWidget {
  TicketsView({super.key});
  final data = Get.arguments;
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
          title: Text(
            data[0],
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Tickets')
                .where('Status', isEqualTo: true)
                .where('header', isEqualTo: data[1])
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
              return !asyncSnapshot.hasData
                  ? Center(
                      child: CircularProgressIndicator(
                        color: redColor,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: asyncSnapshot.data!.docs.length,
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        switch (data[1]) {
                          case 'Gate-Pass-Outwards':
                            return GestureDetector(
                              onTap: () => Get.to(() => GateInwardDetails(
                                    quantity: asyncSnapshot.data!.docs[index]
                                        ['Quantity'],
                                    contact: asyncSnapshot.data!.docs[index]
                                        ['Contact'],
                                    time: asyncSnapshot.data!.docs[index]
                                        ['Time'],
                                    type: asyncSnapshot.data!.docs[index]
                                        ['Type'],
                                    unit: asyncSnapshot.data!.docs[index]
                                        ['Unit'],
                                    poc: asyncSnapshot.data!.docs[index]['POC'],
                                    vehicle: asyncSnapshot.data!.docs[index]
                                        ['Vehicle'],
                                    particular: asyncSnapshot.data!.docs[index]
                                        ['Partiular'],
                                    registeration: asyncSnapshot
                                        .data!.docs[index]['Registeration'],
                                    date: asyncSnapshot.data!.docs[index]
                                        ['Date'],
                                    workers: asyncSnapshot.data!.docs[index]
                                        ['Workers'],
                                    outlet: asyncSnapshot.data!.docs[index]
                                        ['Outlet'],
                                    status: asyncSnapshot.data!.docs[index]
                                        ['Status'],
                                    ticketId: asyncSnapshot.data!.docs[index]
                                        ['Ticket Number'],
                                    uid: asyncSnapshot.data!.docs[index]
                                        ['User ID'],
                                    showButton: true,
                                  )),
                              child: InProgressTicketTile(
                                text: asyncSnapshot.data!.docs[index]['header'],
                                width: width,
                                height: height,
                                header: 'Quantity: ',
                                headerText:
                                    '${asyncSnapshot.data!.docs[index]['Quantity']}'
                                    ' ${asyncSnapshot.data!.docs[index]['Unit']}',
                              ),
                            );
                          case 'Gate-Pass-Inward':
                            return GestureDetector(
                              onTap: () => Get.to(() => GateInwardDetails(
                                    quantity: asyncSnapshot.data!.docs[index]
                                        ['Quantity'],
                                    contact: asyncSnapshot.data!.docs[index]
                                        ['Contact'],
                                    time: asyncSnapshot.data!.docs[index]
                                        ['Time'],
                                    type: asyncSnapshot.data!.docs[index]
                                        ['Type'],
                                    unit: asyncSnapshot.data!.docs[index]
                                        ['Unit'],
                                    poc: asyncSnapshot.data!.docs[index]['POC'],
                                    vehicle: asyncSnapshot.data!.docs[index]
                                        ['Vehicle'],
                                    particular: asyncSnapshot.data!.docs[index]
                                        ['Partiular'],
                                    registeration: asyncSnapshot
                                        .data!.docs[index]['Registeration'],
                                    date: asyncSnapshot.data!.docs[index]
                                        ['Date'],
                                    workers: asyncSnapshot.data!.docs[index]
                                        ['Workers'],
                                    outlet: asyncSnapshot.data!.docs[index]
                                        ['Outlet'],
                                    status: asyncSnapshot.data!.docs[index]
                                        ['Status'],
                                    ticketId: asyncSnapshot.data!.docs[index]
                                        ['Ticket Number'],
                                    uid: asyncSnapshot.data!.docs[index]
                                        ['User ID'],
                                    showButton: true,
                                  )),
                              child: InProgressTicketTile(
                                text: asyncSnapshot.data!.docs[index]['header'],
                                width: width,
                                height: height,
                                header: 'Quantity: ',
                                headerText:
                                    '${asyncSnapshot.data!.docs[index]['Quantity']}'
                                    ' ${asyncSnapshot.data!.docs[index]['Unit']}',
                              ),
                            );
                          case 'Non-Retail-Hour-Activity':
                            return GestureDetector(
                                onTap: () => Get.to(
                                      () => NonRentalActivity(
                                        activity: asyncSnapshot
                                            .data!.docs[index]['Activity'],
                                        dateOfActivityFrom: asyncSnapshot
                                            .data!.docs[index]['Activity From'],
                                        dateOfActivityTo: asyncSnapshot
                                            .data!.docs[index]['Activity To'],
                                        duration: asyncSnapshot
                                            .data!.docs[index]['Duration'],
                                        outlet: asyncSnapshot.data!.docs[index]
                                            ['Outlets'],
                                        overNight: asyncSnapshot
                                            .data!.docs[index]['OverNight'],
                                        status: asyncSnapshot.data!.docs[index]
                                            ['Status'],
                                        timeOfActivity: asyncSnapshot
                                            .data!.docs[index]['Time'],
                                        workers: asyncSnapshot.data!.docs[index]
                                            ['Workers'],
                                        comments: asyncSnapshot
                                            .data!.docs[index]['Comments'],
                                        ticketId: asyncSnapshot
                                            .data!.docs[index]['Ticket Number'],
                                        uid: asyncSnapshot.data!.docs[index]
                                            ['User ID'],
                                        showButton: true,
                                      ),
                                    ),
                                child: InProgressTicketTile(
                                  text: asyncSnapshot.data!.docs[index]
                                      ['header'],
                                  width: width,
                                  height: height,
                                  header: 'Activity: ',
                                  headerText: asyncSnapshot.data!.docs[index]
                                      ['Activity'],
                                ));
                          case 'Security':
                            return GestureDetector(
                              onTap: () => Get.to(() => SecurityTicektDetails(
                                    head: 'Security',
                                    activity: asyncSnapshot.data!.docs[index]
                                        ['Activity'],
                                    dateOfActivity: asyncSnapshot
                                        .data!.docs[index]['Date of Activity'],
                                    duration: asyncSnapshot.data!.docs[index]
                                        ['Duration'],
                                    outlet: asyncSnapshot.data!.docs[index]
                                        ['Outlet'],
                                    overNight: asyncSnapshot.data!.docs[index]
                                        ['OverNight'],
                                    services: asyncSnapshot.data!.docs[index]
                                        ['Services'],
                                    status: asyncSnapshot.data!.docs[index]
                                        ['Status'],
                                    timeOfActivity: asyncSnapshot
                                        .data!.docs[index]['Time of Activity'],
                                    workers: asyncSnapshot.data!.docs[index]
                                        ['Worker'],
                                    ticketId: asyncSnapshot.data!.docs[index]
                                        ['Ticket Number'],
                                    uid: asyncSnapshot.data!.docs[index]
                                        ['User ID'],
                                    showButton: true,
                                  )),
                              child: InProgressTicketTile(
                                  text: asyncSnapshot.data!.docs[index]
                                      ['header'],
                                  width: width,
                                  height: height,
                                  header: 'Activity: ',
                                  headerText: asyncSnapshot.data!.docs[index]
                                      ['Activity']),
                            );
                          case 'Maintainance':
                            return GestureDetector(
                              onTap: () => Get.to(() => SecurityTicektDetails(
                                    head: 'Maintainance',
                                    activity: asyncSnapshot.data!.docs[index]
                                        ['Activity'],
                                    dateOfActivity: asyncSnapshot
                                        .data!.docs[index]['Date of Activity'],
                                    duration: asyncSnapshot.data!.docs[index]
                                        ['Duration'],
                                    outlet: asyncSnapshot.data!.docs[index]
                                        ['Outlet'],
                                    overNight: asyncSnapshot.data!.docs[index]
                                        ['OverNight'],
                                    services: asyncSnapshot.data!.docs[index]
                                        ['Services'],
                                    status: asyncSnapshot.data!.docs[index]
                                        ['Status'],
                                    timeOfActivity: asyncSnapshot
                                        .data!.docs[index]['Time of Activity'],
                                    workers: asyncSnapshot.data!.docs[index]
                                        ['Worker'],
                                    ticketId: asyncSnapshot.data!.docs[index]
                                        ['Ticket Number'],
                                    uid: asyncSnapshot.data!.docs[index]
                                        ['User ID'],
                                    showButton: true,
                                  )),
                              child: InProgressTicketTile(
                                  text: asyncSnapshot.data!.docs[index]
                                      ['header'],
                                  width: width,
                                  height: height,
                                  header: 'Activity: ',
                                  headerText: asyncSnapshot.data!.docs[index]
                                      ['Activity']),
                            );
                          case 'Store-Renovation':
                            return GestureDetector(
                              onTap: () => Get.to(() => RenovationTicektDetails(
                                    activity: asyncSnapshot.data!.docs[index]
                                        ['Activity'],
                                    dateOfActivityFrom: asyncSnapshot
                                        .data!.docs[index]['Activity From'],
                                    dateOfActivityTo: asyncSnapshot
                                        .data!.docs[index]['Activity To'],
                                    duration: asyncSnapshot.data!.docs[index]
                                        ['Duration'],
                                    outlet: asyncSnapshot.data!.docs[index]
                                        ['Outlets'],
                                    overNight: asyncSnapshot.data!.docs[index]
                                        ['OverNight'],
                                    status: asyncSnapshot.data!.docs[index]
                                        ['Status'],
                                    timeOfActivity:
                                        asyncSnapshot.data!.docs[index]['Time'],
                                    use: asyncSnapshot.data!.docs[index]['Use'],
                                    workers: asyncSnapshot.data!.docs[index]
                                        ['Workers'],
                                    comments: asyncSnapshot.data!.docs[index]
                                        ['Comments'],
                                    ticketId: asyncSnapshot.data!.docs[index]
                                        ['Ticket Number'],
                                    uid: asyncSnapshot.data!.docs[index]
                                        ['User ID'],
                                    showButton: true,
                                  )),
                              child: InProgressTicketTile(
                                  text: asyncSnapshot.data!.docs[index]
                                      ['header'],
                                  width: width,
                                  height: height,
                                  header: 'Activity: ',
                                  headerText: asyncSnapshot.data!.docs[index]
                                      ['Activity']),
                            );
                        }

                        return Center(
                          child: CircularProgressIndicator(
                            color: redColor,
                          ),
                        );
                      });
            }));
  }
}
