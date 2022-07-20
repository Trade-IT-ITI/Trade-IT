import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trade_it/screens/home/home_ui.dart';

import '../screens/profile/profile_ui.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    // Icons.favorite,
    // Icons.notifications,
    Icons.person,
  ];

  List<Widget> widgetList = [
    Home(),
    // const Faviorate(),
    // const Notifications(),
    Profile(),
  ];
  @override
  void initState() {
    super.initState();
    _bottomNavIndex = widget.index;
  }

  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: widgetList[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Theme.of(context).colorScheme.primary,
        iconSize: 45,
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
