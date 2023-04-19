import 'package:chips_choice/chips_choice.dart';

import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInterestsPage extends StatefulWidget {
  final PageController pageController;
  const GetInterestsPage(this.pageController, {Key? key}) : super(key: key);

  @override
  GetInterestsPageState createState() =>
      GetInterestsPageState(this.pageController);
}

class GetInterestsPageState extends State<GetInterestsPage> {
  final PageController pageController;
  // single choice value
  int tag = 3;
  GetInterestsPageState(this.pageController);

  final NavigationService _navigationService = locator<NavigationService>();

  // multiple choice value
  List<String> tags = ['Education'];
  String? pageType;

  // list of string options
  List<String> interests = [
    "Technology",
    "Health",
    "Science",
    "Fitness",
    "Food and Cooking",
    "Travel",
    "Fashion",
    "Beauty",
    "Entertainment",
    "Sports",
    "Business",
    "Finance",
    "Politics",
    "Education",
    "Environment",
    "Art and Culture",
    "Social Issue",
    "Personal Development",
    "Psychology",
    "History",
  ];

  List<String>? selected = [];
  bool flag = false;

  _getPageType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      pageType = prefs.getString('pageType');
    });
  }

  void initState() {
    super.initState();
    _getPageType();
  }

  saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('interests', tags);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50.0),
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Pick your interests',
                  style: TextStyle(
                      color: IOTheme.IOGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300),
            child: ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) {
                tags = val;
              },
              choiceItems: C2Choice.listFrom<String, String>(
                source: interests,
                value: (i, v) => v,
                label: (i, v) => v,
                tooltip: (i, v) => v,
              ),
              choiceCheckmark: true,
              textDirection: TextDirection.rtl,
              wrapped: true,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: Container(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  if (flag) {
                    flag = false;
                    saveData();
                  }
                  flag = true;
                  _navigationService.navigateTo('/navSelect',
                      arguments: {'pageType': pageType});
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 90.0),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_forward_ios_outlined, size: 13),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: IOTheme.IOGreen.withOpacity(0.5),
                  foregroundColor: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
