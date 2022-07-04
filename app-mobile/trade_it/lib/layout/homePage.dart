import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trade_it/screens/faviorate/faviorate.dart';
import 'package:trade_it/screens/home/home_ui.dart';
import 'package:trade_it/screens/profile/profile.dart';

import '../screens/notification/notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.notifications,
    Icons.person,
  ];
  List<Widget> widgetList = [
    Home(),
    const Faviorate(),
    const Notifications(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: widgetList[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Theme.of(context).colorScheme.primary,
        iconSize: 35,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
