import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:interviewo/screens/tabs/HomePage.dart';
import 'package:interviewo/widgets/BottomBar.dart';
import 'package:interviewo/widgets/DrawerWidget.dart';
import 'package:interviewo/widgets/MenuWidget.dart';
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
  final _ZoomDrawerController = ZoomDrawerController();

  static List<MenuClass> mainMenu = [
    MenuClass(tr("payment"), Icons.payment, 0),
    MenuClass(tr("promos"), Icons.card_giftcard, 1),
    MenuClass(tr("notifications"), Icons.notifications, 2),
    MenuClass(tr("help"), Icons.help, 3),
    MenuClass(tr("about_us"), Icons.info_outline, 4),
  ];

  void _updatePage(int index) {
    context.read<MenuProvider>().updateCurrentPage(index);
    _ZoomDrawerController.toggle?.call();
  }

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
      extendBody: true,

      // backgroundColor: Colors.transparent,
      drawer: ZoomDrawer(
        controller: _ZoomDrawerController,
        menuScreen: MenuScreen(
          mainMenu,
          callback: _updatePage,
          current: 0,
        ),
        mainScreen: widget.w!,
        borderRadius: 24.0,
        showShadow: false,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
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

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index == currentPage) return;
    _currentPage = index;
    notifyListeners();
  }
}
