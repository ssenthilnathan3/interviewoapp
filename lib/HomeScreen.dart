import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/screens/tabs/HomePage.dart';
import 'package:interviewo/widgets/BottomBar.dart';
import 'package:interviewo/widgets/DrawerWidget.dart';
import 'package:interviewo/widgets/OfflineWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget tabBody = Container(child: HomePage());
  int position = 1;
  bool isUpdateShown = false;

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
    return Container(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ConnectivityWidgetWrapper(
                disableInteraction: true,
                offlineWidget: OfflineWidget(),
                child: Stack(children: <Widget>[
                  tabBody,
                  Positioned(
                      bottom: 0,
                      height: 70,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width)),
                  Positioned(
                    bottom: 0,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: BottomBar(
                        bottomBarCallBack: bottomBarCallBack,
                        positionCallBack: positionCallBack,
                        position: position),
                  ),
                ]),
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
