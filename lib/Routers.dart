import 'package:interviewo/HomeScreen.dart';
import 'package:interviewo/screens/DetailPage.dart';

import 'package:flutter/material.dart';
import 'package:interviewo/screens/IntroScreen.dart';
import 'package:interviewo/screens/auth/GoogleAuth.dart';
import 'package:interviewo/screens/auth/LoginPage.dart';
import 'package:interviewo/screens/auth/RegisterPage.dart';
import 'package:interviewo/screens/tabs/DiscoverPage.dart';
import 'package:interviewo/screens/tabs/ExplorePage.dart';
import 'package:interviewo/screens/tabs/HomePage.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ********** Intro,Home,Commonpage,personal profile ***************************//
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/intro-screen':
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case '/googleAuth':
        return MaterialPageRoute(builder: (_) => GoogleSignInPage());

      // ********** Default Route ***************************//
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
