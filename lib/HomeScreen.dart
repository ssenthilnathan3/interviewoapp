import 'package:flutter/material.dart';

import 'package:interviewo/components/BottomBar.dart';
import 'package:interviewo/components/drawer/drawer_1.dart';
import 'package:interviewo/components/drawer/drawer_controller.dart';
import 'package:interviewo/screens/DiscoverPage.dart';
import 'package:interviewo/screens/ExplorePage.dart';

import 'package:interviewo/screens/HomePage.dart';

import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget tabBody = Container(color: Colors.white10, child: HomePage());
  int position = 1;

  final NavigationService _navigationService = locator<NavigationService>();

  bottomBarCallBack(newWidget) {
    setState(() {
      tabBody = newWidget;
    });
  }

  positionCallBack(newPosition) {
    setState(() {
      position = newPosition;
    });
  }

  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.ForPerson;
    screenView = HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DrawerUserController(
        screenIndex: drawerIndex,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        onDrawerCall: (DrawerIndex drawerIndexdata) {
          changeIndex(drawerIndexdata);
          //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
        },
        screenView: screenView,
        //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
      ),
      Positioned(
        bottom: 0,
        width: MediaQuery.of(context).size.width,
        child: BottomBar(
            bottomBarCallBack: bottomBarCallBack,
            positionCallBack: positionCallBack,
            position: position),
      )
    ]);
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.ForPerson:
          setState(() {
            screenView = HomePage();
          });
          break;
        case DrawerIndex.ForUniv:
          _navigationService.navigateTo('/login');
          break;
        case DrawerIndex.ForJobs:
          _navigationService.navigateTo('/login');
          break;

        case DrawerIndex.ForCorps:
          _navigationService.navigateTo('/login');
          break;

        default:
          break;
      }
    }
  }
}
