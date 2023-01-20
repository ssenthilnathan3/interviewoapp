import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _selectedIndex = 1;

  var _tabs = ['/explore', '/home', '/discover'];

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
        _navigationService.navigateTo(_tabs[index]);
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
    );
  }
}
