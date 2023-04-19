import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/screens/common_pages/GetAgePage.dart';
import 'package:interviewo/screens/common_pages/GetInterests.dart';
import 'package:interviewo/screens/common_pages/TestPage.dart';
import 'package:interviewo/screens/common_pages/GetRole.dart';
import 'package:interviewo/viewmodels/CommonPageModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

_CommonPageState _globalState = new _CommonPageState();

class CommonPage extends StatefulWidget {
  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  final pageController = new PageController(initialPage: 0, keepPage: false);
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  _savePref() async {
    final SharedPreferences _prefs = await prefs;
    _prefs.setBool('commonPage', true);
  }

  @override
  void initState() {
    super.initState();
    _savePref();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommonDataModel>.reactive(
        viewModelBuilder: () => CommonDataModel(),
        onViewModelReady: (model) => model.initialise(),
        // fireOnModelReadyOnce: true,
        builder: (context, model, child) {
          return Container(
            color: Colors.white,
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  Flexible(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: <Widget>[
                        SelectionPage(pageController),
                        AgePage(pageController),
                        GetInterestsPage(pageController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
