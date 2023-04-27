import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewo/screens/tabs/DiscoverPage.dart';
import 'package:interviewo/screens/tabs/ExplorePage.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

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

  List<BottomBarItem> barItems = [
    BottomBarItem(
      title: Text('Explore'),
      icon: Icon(Icons.folder_special),
      backgroundColor: Color(0xFF7BF4AF),
    ),
    BottomBarItem(
      title: Text('Home'),
      icon: Icon(Icons.accessibility_new),
      backgroundColor: Color(0xFF5FCFEB),
    ),
    BottomBarItem(
      title: Text('Discover'),
      icon: Icon(Icons.favorite),
      backgroundColor: Color(0xFFFF5757),
    ),

    /// Add more BarItem if you want
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _handleWillPop,
        // onWillPop: (() => _onBackPressed(context)) as Future<bool> Function(),
        child: StylishBottomBar(
          elevation: 0,
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizotnal,
            padding: EdgeInsets.symmetric(horizontal: 15),
            // barStyle: BubbleBarStyle.vertical,
            bubbleFillStyle: BubbleFillStyle.fill,
            // bubbleFillStyle: BubbleFillStyle.outlined,
            opacity: 0.3,
          ),
          items: barItems,
          currentIndex: activeIndex,
          onTap: _onTap,
        ));
  }

  Future<bool> _handleWillPop() async {
    changeActiveIndex(1);
    widget.bottomBarCallBack(currentTab[1]);
    widget.positionCallBack(activeIndex);
    return false;
  }
}
