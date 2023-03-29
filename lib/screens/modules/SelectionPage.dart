import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  bool isLoggedIn = false, isRegistered = false;
  List pageList = [
    {"image": "assets/images/1.png", "page": "student"},
    {
      "image": "assets/images/2.png",
      "page": "instructor",
    },
    {
      "image": "assets/images/3.png",
      "page": "organisation",
    },
  ];

  List titles = ["To Learn", "To Teach", "To Partner"];

  final NavigationService _navigationService = locator<NavigationService>();

  int selectedIndex = -1;

  void _onSelected(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('selectionPage', true);
    await prefs.setString('pageType', pageList[selectedIndex]['page']);
  }

  void _getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn')!;
      isRegistered = prefs.getBool('isRegistered')!;
    });
  }

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 100.0),
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Select Your Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: IOTheme.IOBlue,
                      fontWeight: FontWeight.w300,
                      fontSize: 27.0),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 200.0),
              child: GridView.builder(
                padding:
                    EdgeInsets.only(left: 5.0, right: 5.0, top: 10, bottom: 10),
                itemCount: pageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2),
                itemBuilder: (context, index) {
                  // final item = searchList[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      _onSelected(context);
                      Timer(Duration(seconds: 5), () {
                        (isLoggedIn || isRegistered)
                            ? _navigationService.navigateTo("/navSelect",
                                arguments: {
                                    'pageType': pageList[selectedIndex]['page']
                                  })
                            : _navigationService.navigateTo("/login");
                      });
                    },
                    child: Container(
                      height: 150.0,
                      child: Card(
                          elevation: 8,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          color: Colors.grey[100],
                          shape: (selectedIndex == index)
                              ? RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: IOTheme.IOBlue, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                )
                              : RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(pageList[index]['image'],
                                fit: BoxFit.fitHeight),
                          )),
                    ),
                  );
                },
              )),
        ],
      ),
    ));
  }
}
