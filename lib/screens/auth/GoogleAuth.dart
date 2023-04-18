import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/GoogleAuthProvider.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInPage extends StatefulWidget {
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  State<GoogleSignInPage> createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String? name;
  String? email;
  String pageType = "";

  _getPageType() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      pageType = _prefs.getString('pageType') ?? 'student';
    });
  }

  @override
  void initState() {
    super.initState();
    _getPageType();
  }

  saveUserData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [SizedBox(height: 20), Text("Connect with Google")],
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/googleandinterviewo.png'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await AuthService().signInWithGoogle();
                  await AuthService().handleAuthStateChanges();
                  setState(() {
                    name = FirebaseAuth.instance.currentUser!.displayName;
                    email = FirebaseAuth.instance.currentUser!.email;
                  });
                  saveUserData();
                } on FirebaseAuthException catch (e) {
                  print(e);
                }

                _navigationService.navigateTo('/navSelect',
                    arguments: {'pageType': pageType});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sign in with Google",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: IOTheme.IOBlue),
            )
          ]),
        ));
  }
}
