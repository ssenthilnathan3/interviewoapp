import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/viewmodels/BaseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  bool introScreen = false;
  bool selectionPage = false;
  String? pageType = "";

  void initialise() {
    // handleStartUpServices();
    _mockCheckForSession().then((status) async {
      if (status) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        introScreen = prefs.getBool("introScreen") ?? false;
        pageType = prefs.getString('pageType') ?? "";
        selectionPage = prefs.getBool("selectionPage") ?? false;

        if (introScreen) {
          if (selectionPage) {
            _navigationService.navigateWithReplace("/navSelect",
                arguments: {'pageType': pageType});
          } else {
            _navigationService.navigateWithReplace('/selectionPage');
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
