import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:interviewo/screens/tabs/DiscoverPage.dart';
import 'package:interviewo/screens/tabs/ExplorePage.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class AppBottomBar extends StatefulWidget {
  final Function bottomBarCallBack;
  final Function positionCallBack;
  final int position;
  Widget? w;
  AppBottomBar(
      {required this.bottomBarCallBack,
      required this.positionCallBack,
      required this.position,
      this.w});

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  Widget? _w;
  FToast? fToast;
  var currentTab;

  int activeIndex = 1;

  var iconData = <IconData>[
    Icons.explore,
    Icons.home,
    Icons.search,
  ];

  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      currentTab = [
        ExplorePage(),
        widget.w!,
        DiscoverPage(),
      ];
    });

    print(widget.position);
    activeIndex = widget.position;
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  _onTap(int index) {
    setState(() {
      activeIndex = index;
    });
    widget.bottomBarCallBack(currentTab[index]);
    widget.positionCallBack(activeIndex);
  }

  void changeActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  var activeColorList = [
    Color(0xFF7BF4AF),
    Color(0xFF5FCFEB),
    Color(0xFFFF5757)
  ];

  var barItems = [
    FloatingNavbarItem(
      title: 'Explore',
      icon: Icons.folder_special,
    ),
    FloatingNavbarItem(
      title: 'Home',
      icon: Icons.accessibility_new,
    ),
    FloatingNavbarItem(
      title: 'Discover',
      icon: Icons.favorite,
    ),

    /// Add more BarItem if you want
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleWillPop,
      // onWillPop: (() => _onBackPressed(context)) as Future<bool> Function(),
      child: FloatingNavbar(
        backgroundColor: Colors.white,
        onTap: _onTap,
        currentIndex: activeIndex,
        elevation: 0,
        borderRadius: 20,
        unselectedItemColor: Colors.black,
        selectedItemColor: activeColorList[activeIndex],
        items: barItems,
      ),
    );
  }

  Future<bool> _handleWillPop() async {
    changeActiveIndex(1);
    widget.bottomBarCallBack(currentTab[1]);
    widget.positionCallBack(activeIndex);
    return false;
  }
}
