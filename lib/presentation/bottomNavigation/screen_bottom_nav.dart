import 'package:flutter/material.dart';
import 'package:netflix_application/core/imports/const_screens.dart';

class ScreenBottomNavigation extends StatefulWidget {
  const ScreenBottomNavigation({super.key});

  @override
  State<ScreenBottomNavigation> createState() => _ScreenBottomNavigationState();
}

class _ScreenBottomNavigationState extends State<ScreenBottomNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ScreenHome(),
      const ScreenNewAndHot(),
      const ScreenFastLaugh(),
      const ScreenSearch(),
      const ScreenDownload()
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: _bottommNav(),
    );
  }

  BottomNavigationBar _bottommNav() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      selectedIconTheme: const IconThemeData(color: text),
      unselectedIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 90, 89, 89)),
      items: [
        bottomNavItem(icon: Icons.home, label: 'Home'),
        bottomNavItem(icon: Icons.filter, label: 'New & Hot'),
        bottomNavItem(icon: Icons.insert_emoticon, label: 'Fast Laughs'),
        bottomNavItem(icon: Icons.search, label: 'Search'),
        bottomNavItem(icon: Icons.download, label: 'Downloads'),
      ],
    );
  }
}
