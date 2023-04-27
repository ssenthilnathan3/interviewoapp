import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/widgets/BottomBar.dart';
import 'package:interviewo/widgets/OfflineWidget.dart';

class HomeScreen extends StatefulWidget {
  Widget? w;

  HomeScreen({Key? key, this.w});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int position = 1;
  bool isUpdateShown = false;

  bottomBarCallBack(newWidget) {
    setState(() {
      widget.w = newWidget;
    });
  }

  positionCallBack(newPosition) {
    setState(() {
      position = newPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // // backgroundColor: Colors.transparent,

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
                widget.w!,
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: AppBottomBar(
                    bottomBarCallBack: bottomBarCallBack,
                    positionCallBack: positionCallBack,
                    position: position,
                    w: widget.w!,
                  ),
                ),
              ]),
            );
          }
        },
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }
}
