import 'package:flutter/material.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseCategories extends StatefulWidget {
  const CourseCategories({Key? key}) : super(key: key);

  @override
  State<CourseCategories> createState() => _CourseCategoriesState();
}

class _CourseCategoriesState extends State<CourseCategories> {
  final NavigationService _navigationService = locator<NavigationService>();
  String? pageType;

  @override
  void initState() {
    super.initState();
    _getPageType();
  }

  _getPageType() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      pageType = _prefs.getString('pageType');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _navigationService
                .navigateTo('/navSelect', arguments: {'pageType': pageType});
          },
        )),
        body: GridView.count(
            crossAxisCount: 2,
            // shrinkWrap: true,
            children: List.generate(
                9,
                (i) => GestureDetector(
                      onDoubleTap: () {
                        print(i);
                      },
                      child: GridAnimatorWidget(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Container(
                                height: 40,
                                width: 60,
                                child: Image.asset('assets/images/3.png')),
                          ),
                        ),
                      ),
                    )).toList()));
  }
}
