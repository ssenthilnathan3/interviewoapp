import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/ToastMsg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _selectedIndex = 1;
  int _lastTimeBackButtonWasTapped = 0;
  static const exitTimeInMillis = 2000;

  var _tabs = ['/explore', '/home', '/discover'];

  void changeActiveIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _handleWillPop() async {
    if (_selectedIndex == 0) {
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
      return false;
    }
  }

  _getExitToast() {
    return ToastMsg("Press again to exit", fToast);
  }

  FToast? fToast;
  @override
  void initState() {
    _selectedIndex = 1;
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _handleWillPop,
        child: FlashyTabBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _navigationService.navigateWithReplace(_tabs[index]);
          },
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.event),
              title: Text('Explore'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.search),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.highlight),
              title: Text('Discover'),
            ),
          ],
        ));
  }
}
