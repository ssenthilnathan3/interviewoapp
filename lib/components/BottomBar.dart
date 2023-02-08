import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:interviewo/screens/DiscoverPage.dart';
import 'package:interviewo/screens/ExplorePage.dart';
import 'package:interviewo/screens/HomePage.dart';

class BottomBar extends StatefulWidget {
  final Function bottomBarCallBack;
  final Function positionCallBack;
  final int position;
  const BottomBar(
      {Key? key,
      required this.bottomBarCallBack,
      required this.positionCallBack,
      required this.position})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    HomePage(),
    DiscoverPage(),
  ];

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.bottomBarCallBack(_widgetOptions[index]);
    widget.positionCallBack(_selectedIndex);
  }

  void changeActiveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initState() {
    super.initState();

    _selectedIndex = widget.position;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.transparent.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.explore,
                text: 'Explore',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Discover',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _onTap(index);
            },
          ),
        ),
      ),
    );
  }
}
