import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final NavigationService _navigationService = locator<NavigationService>();
  final introKey = GlobalKey<_IntroScreenState>();

  void _onIntroEnd(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // _navigationService.navigateWithReplace('/commonPage');
    await prefs.setBool('introScreen', true);
  }

  @override
  void initState() {
    super.initState();
    _onIntroEnd(context);
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: IOTheme.IOGreen,
      leading: TextButton(
        child: Text("Skip",
            style: TextStyle(
                color: IOTheme.IOBlue,
                fontWeight: FontWeight.bold,
                fontSize: 15)),
        onPressed: () {
          _navigationService.navigateTo("/commonPage");
        },
      ),
      pageBackgroundColor: Colors.white,
      finishButtonText: 'Register',
      onFinish: () {
        _navigationService.navigateTo("/login");
      },
      background: [
        Container(),
        Container(),
      ],
      totalPage: 2,
      speed: 1.5,
      pageBodies: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Image.asset('assets/images/slide_1.png'),
              SizedBox(height: 30),
              Text("Reinventing Education",
                  style: TextStyle(
                      color: IOTheme.IOBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 28))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Image.asset('assets/images/slide_2.png'),
              SizedBox(height: 70),
              Text("Reinventing Learning",
                  style: TextStyle(
                      color: IOTheme.IOBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 28))
            ],
          ),
        ),
      ],
    );
  }
}
