import 'package:flutter/material.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgePage extends StatefulWidget {
  final PageController pageController;

  AgePage(
    this.pageController, {
    Key? key,
  });

  @override
  _AgePageState createState() => _AgePageState(this.pageController);
}

class _AgePageState extends State<AgePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final PageController pageController;

  _AgePageState(this.pageController);

  int _currentIntValue = 16;
  bool flag = true;
  int? age;

  saveData() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('age', age.toString());
    pageController.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.ease);
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
                  'Select your Age',
                  style: TextStyle(
                      color: IOTheme.IOGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300, left: 50),
            child: NumberPicker(
              selectedTextStyle: TextStyle(
                  color: IOTheme.IOGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              value: _currentIntValue,
              minValue: 16,
              maxValue: 80,
              step: 1,
              itemHeight: 100,
              axis: Axis.horizontal,
              onChanged: (value) => setState(() => _currentIntValue = value),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
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
