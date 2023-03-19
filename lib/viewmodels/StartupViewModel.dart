import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/viewmodels/BaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool introScreen = false;
  bool commonScreen = false;
  bool registerPage = false;
  // bool isdeeplink = false;
  // bool isUpdateShown = false;

  void initialise() {
    // handleStartUpServices();
    _mockCheckForSession().then((status) async {
      if (status) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        introScreen = prefs.getBool("introScreen") ?? false;
        // isdeeplink = prefs.getBool("isdeeplink") ?? false;
        commonScreen = prefs.getBool("commonDataPage") ?? false;
        registerPage = prefs.getBool("registerPage") ?? false;

        // print(isdeeplink);
        // if (!isdeeplink) {

        // _navigationService.navigateWithReplace('/commonPage');

        _navigationService.navigateWithReplace('/intro-screen');

        // } else {
        //   _navigationService.navigateWithReplace('/commonPage');
        // }
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }

  // Future handleStartUpServices() async {
  //   await _dynamicLinkService.handleDynamicLinks();
  //   // await _pushNotificationService.init();
  //   await _deviceInfoService.deviceInfo();
  // }
}
