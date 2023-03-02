import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:squareone_admin/ui/views/forms/add_depart_member/add_depart_member_view.dart';
import 'package:squareone_admin/ui/views/home/maintainance/maintainance_view.dart';
import 'package:squareone_admin/ui/views/home/security/security_view.dart';
import 'package:squareone_admin/ui/views/notifications/notifications_view.dart';
import 'package:squareone_admin/ui/views/profile/profile_view.dart';

import '../views/home/admin/home_view.dart';

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
  'Non-Retail-Hour-Activity',
];

List profileImg = [
  'assets/home/ticket.svg',
  'assets/home/ticket.svg',
  'assets/profile/outlet.svg',
  'assets/profile/profile.svg'
];

List profileText = [
  'Closed Tickets',
  'In Progress Tickets',
  'All Outlets',
  'All Departments',
];

List<SalomonBottomBarItem> adminItems = [
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

List<SalomonBottomBarItem> maintainanceItems = [
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
    icon: SvgPicture.asset('assets/nav_bar/profile.svg'),
    title: const Text('Profile'),
  ),
];

List<SalomonBottomBarItem> securityItems = [
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
    icon: SvgPicture.asset('assets/nav_bar/profile.svg'),
    title: const Text('Profile'),
  ),
];

final adminPages = [
  const HomeView(),
  const NotificationsView(),
  const AddDepartmentView(),
  const ProfileView(),
];

final maintainancePages = [
  const MaintainanceView(),
  const NotificationsView(),
  // const AddDepartmentView(),
  const ProfileView(),
];

final securityPages = [
  const SecurityView(),
  const NotificationsView(),
  // const AddDepartmentView(),
  const ProfileView(),
];
