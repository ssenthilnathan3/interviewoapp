import 'package:flutter/material.dart';

import 'package:interviewo/components/BottomBar.dart';

import 'package:interviewo/screens/HomePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget tabBody = Container(color: Colors.white10, child: HomePage());
  int position = 1;

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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      tabBody,
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
}
