import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Color redColor = const Color(0xffC12934);
Color greenColor = const Color(0xFFDEFFE5);
Color textGreenColor = const Color(0xFF27BB4A);
Color textRedColor = const Color(0xFFC12934);
Color bgRedColor = const Color(0xFFFFDEDE);
Color greyTextColor = const Color(0xFF858597);

List homeCardTitle = [
  'Store Renovation ',
  'Security',
  'Maintainance',
  'Gate Pass Inward',
  'Gate Pass Outwards',
  'Non-Retail Hour Activity',
];
List homeCardImages = [
  'assets/home/renovation.svg',
  'assets/home/security.svg',
  'assets/home/maintenance.svg',
  'assets/home/gate_pass_inward.svg',
  'assets/home/gate_pass_outward.svg',
  'assets/home/non_retail.svg',
];

List homeCardHeaders = [
  'Store-Renovation',
  'Security',
  'Maintainance',
  'Gate-Pass-Inward',
  'Gate-Pass-Outwards',
  'Non-Rental-Hour-Activity',
];

List securityCardTitle = [
  'Store Renovation ',
  'Security',
  'Gate Pass Inward',
  'Gate Pass Outwards',
];

List securityCardImages = [
  'assets/home/renovation.svg',
  'assets/home/security.svg',
  'assets/home/gate_pass_inward.svg',
  'assets/home/gate_pass_outward.svg',
];

List securityCardHeaders = [
  'Store-Renovation',
  'Security',
  'Gate-Pass-Inward',
  'Gate-Pass-Outwards',
];

List maintainanceCardTitle = [
  'Maintainance',
  'Non-Retail Hour Activity',
];

List maintainanceCardImages = [
  'assets/home/maintenance.svg',
  'assets/home/non_retail.svg',
];

List maintainanceCardHeaders = [
  'Maintainance',
  'Non-Rental-Hour-Activity',
];

List<SalomonBottomBarItem> items = [
  SalomonBottomBarItem(
    icon: SvgPicture.asset('assets/nav_bar/home.svg'),
    title: const Text(
      'Home',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  ),
  SalomonBottomBarItem(
    icon: SvgPicture.asset('assets/nav_bar/notification.svg'),
    title: const Text(
      'Notification',
      style: TextStyle(fontSize: 11),
    ),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.groups_3_outlined),
    title: const Text(
      'Workers',
      style: TextStyle(fontSize: 11),
    ),
  ),
  SalomonBottomBarItem(
    icon: SvgPicture.asset('assets/nav_bar/profile.svg'),
    title: const Text('Profile'),
  ),
];
final pages = [
  // const Home(),
  // const NotificationsView(),
  // const WorkersView(),
  // const ProfileView(),
];

final List profileCardImages = [
  'assets/profile/profile_1.svg',
  'assets/profile/profile_2.svg',
  'assets/profile/profile_3.svg',
];
