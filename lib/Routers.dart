import 'package:interviewo/screens/DiscoverPage.dart';
import 'package:interviewo/screens/ExplorePage.dart';
import 'package:interviewo/views/home.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // ********** Intro,Home,Commonpage,personal profile ***************************//
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/explore':
        return MaterialPageRoute(builder: (_) => ExplorePage());
      case '/discover':
        return MaterialPageRoute(builder: (_) => DiscoverPage());
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
