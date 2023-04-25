import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/viewmodels/BaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool introScreen = false;
  bool commonPage = false;
  String pageType = "";

  void initialise() {
    // handleStartUpServices();
    _mockCheckForSession().then((status) async {
      if (status) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        introScreen = prefs.getBool("introScreen") ?? false;
        pageType = prefs.getString('pageType') ?? "student";
        commonPage = prefs.getBool("commonPage") ?? false;

        if (introScreen) {
          if (commonPage) {
            _navigationService.navigateWithReplace('/commonPage');
            // _navigationService.navigateWithReplace("/navSelect",
            //     arguments: {'pageType': pageType});
          } else {
            _navigationService.navigateWithReplace('/commonPage');
          }
        } else {
          _navigationService.navigateWithReplace('/intro-screen');
        }
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }
}
