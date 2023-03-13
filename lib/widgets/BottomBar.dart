import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewo/screens/tabs/DiscoverPage.dart';
import 'package:interviewo/screens/tabs/ExplorePage.dart';
import 'package:interviewo/screens/tabs/HomePage.dart';
import 'package:interviewo/utils/ToastMsg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  final Function bottomBarCallBack;
  final Function positionCallBack;
  final int position;
  const BottomBar(
      {required this.bottomBarCallBack,
      required this.positionCallBack,
      required this.position});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _lastTimeBackButtonWasTapped = 0;
  static const exitTimeInMillis = 2000;

  FToast? fToast;

  int activeIndex = 0;

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

  var currentTab = [
    ExplorePage(),
    HomePage(),
    DiscoverPage(),
  ];

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

  @override
  void initState() {
    print(widget.position);
    activeIndex = widget.position;
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleWillPop,
      // onWillPop: (() => _onBackPressed(context)) as Future<bool> Function(),
      child: SalomonBottomBar(
        currentIndex: activeIndex,
        curve: Curves.linear,
        duration: Duration(milliseconds: 400),
        onTap: _onTap,
        margin: EdgeInsets.all(8.0),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.folder_special),
            title: Text("Explore"),
            selectedColor: Color(0xFF7BF4AF),
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.accessibility_new),
            title: Text("Home"),
            selectedColor: Color(0xFF5FCFEB),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Discover"),
            selectedColor: Color(0xFFFF5757),
          ),
        ],
      ),
    );
  }

  Future<bool> _handleWillPop() async {
    if (activeIndex == 0) {
      final _currentTime = DateTime.now().millisecondsSinceEpoch;

      if (_lastTimeBackButtonWasTapped != null &&
          (_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return true;
      } else {
        _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          _getExitToast(),
        );
        return false;
      }
    } else {
      changeActiveIndex(0);
      widget.bottomBarCallBack(currentTab[0]);
      widget.positionCallBack(activeIndex);
      return false;
    }
  }

  _getExitToast() {
    return ToastMsg("Press again to exit", fToast);
  }
}
