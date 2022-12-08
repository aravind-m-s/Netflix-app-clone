import 'package:flutter/material.dart';
import 'package:netflix_application/core/imports/const_screens.dart';

BottomNavigationBarItem bottomNavItem(
    {required IconData icon, required String label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
    backgroundColor: bg,
  );
}
