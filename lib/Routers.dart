import 'package:interviewo/HomeScreen.dart';
import 'package:interviewo/screens/ProfileEdit.dart';
import 'package:interviewo/screens/SettingsPage.dart';
import 'package:interviewo/screens/common_pages/CommonPage.dart';
import 'package:interviewo/screens/tabs/detail_pages/CourseDetailPage.dart';

import 'package:flutter/material.dart';
import 'package:interviewo/screens/IntroScreen.dart';
import 'package:interviewo/screens/auth/GoogleAuth.dart';
import 'package:interviewo/screens/auth/LoginPage.dart';
import 'package:interviewo/screens/auth/UserProfile.dart';
import 'package:interviewo/screens/auth/RegisterPage.dart';
import 'package:interviewo/screens/modules/ForInstructors.dart';
import 'package:interviewo/screens/modules/ForOrganisations.dart';
import 'package:interviewo/screens/modules/ForUniversities.dart';
import 'package:interviewo/screens/common_pages/GetRole.dart';

import 'package:interviewo/screens/tabs/HomePage.dart';
import 'package:interviewo/screens/tabs/detail_pages/InstructorDetailPage.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case '/intro-screen':
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case '/userProfile':
        return MaterialPageRoute(builder: (_) => ProfilePageUI());
      case '/googleAuth':
        return MaterialPageRoute(builder: (_) => GoogleSignInPage());

      // ********** Home Page Routes ***************************//
      case '/commonPage':
        return MaterialPageRoute(builder: (_) => CommonPage());
      case '/navSelect':
        final Map arg = settings.arguments as Map;
        var pageType = arg['pageType'];
        if (pageType == "student") {
          return MaterialPageRoute(builder: (_) => HomeScreen(w: HomePage()));
        } else if (pageType == "instructor") {
          return MaterialPageRoute(
              builder: (_) => HomeScreen(w: ForInstructorsPage()));
        } else if (pageType == "organisations") {
          return MaterialPageRoute(
              builder: (_) => HomeScreen(w: ForOrganisationsPage()));
        } else if (pageType == "universities") {
          return MaterialPageRoute(
              builder: (_) => HomeScreen(w: ForUniversitiesPage()));
        } else {
          return MaterialPageRoute(builder: (_) => HomeScreen(w: HomePage()));
        }

      // ********** Detail Page Routes ***************************//
      case '/instructor-detail':
        return MaterialPageRoute(builder: (_) => InstructorPage());

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
