import 'dart:async';
import 'dart:math';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:interviewo/widgets/CardWidget.dart';
import 'package:interviewo/model/placemodel.dart';
import 'package:interviewo/data/data.dart';
import 'package:interviewo/model/speciality.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:flutter/material.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:interviewo/widgets/DrawerWidget.dart';
import 'package:interviewo/widgets/MenuWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

String selectedCategorie = "Health";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    "Education",
    "Environment",
    "Art and Culture",
    "Social Issue",
    "Personal Development",
    "Technology",
    "Health",
    "Science",
  ];
  final NavigationService _navigationService = locator<NavigationService>();

  late List<CourseModel> courses;
  late List<PlaceModel> places;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    places = getPlace();
    courses = getCourses();
    _drawerView();
  }

  List<DrawerItem> drawerItems = [
    DrawerItem(icon: Icon(Icons.person_3_outlined), label: "For You"),
    DrawerItem(icon: Icon(Icons.school), label: "For Students"),
    DrawerItem(icon: Icon(Icons.school), label: "For Universities"),
    DrawerItem(icon: Icon(Icons.corporate_fare), label: "For Organisation"),
    DrawerItem(icon: Icon(Icons.person), label: "For Instructors"),
  ];

  _drawerView() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? pageType;

    setState(() {
      pageType = _prefs.getString('pageType');
    });

    if (pageType == "student") {
      drawerItems.removeAt(1);
    } else if (pageType == "instructor") {
      drawerItems.removeAt(3);
    } else if (pageType == "university") {
      drawerItems.removeAt(4);
    } else {
      drawerItems.removeAt(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldKey,
        drawer: SafeArea(
          child: CurvedDrawer(
            color: IOTheme.IOBlue,
            labelColor: Colors.black54,
            width: 100,
            animationDuration: Duration(milliseconds: 500),
            items: drawerItems,
            onTap: (index) {
              Timer(Duration(seconds: 3), () {
                if (index == 0) {
                  _navigationService.navigateTo('/userProfile');
                } else if (index == 1) {
                  _navigationService.navigateTo('/navSelect',
                      arguments: {'pageType': 'universities'});
                } else if (index == 2) {
                  _navigationService.navigateTo('/navSelect',
                      arguments: {'pageType': 'organisations'});
                } else {
                  _navigationService.navigateTo('/navSelect',
                      arguments: {'pageType': 'instructor'});
                }
              });
            },
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: SearchHeader(
              scaffoldKey: _scaffoldKey,
              icon: Icons.person_2_outlined,
              title: 'InterviewO',
              search: _Search(),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white10,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.8),
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 0,
                              backgroundColor: Colors.grey,
                            ),
                            child: Text("More",
                                style: TextStyle(color: Colors.black)),
                            onPressed: () {
                              _navigationService
                                  .navigateWithReplace('/course-categories');
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: courses.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CourseTile(
                              imagePath: courses[index].imagePath,
                              speciality: courses[index].speciality,
                              noOfDoctors: courses[index].noOfDoctors,
                              backColor: courses[index].backgroundColor,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Courses",
                      style: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                          itemCount: places.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedCard(
                              placeModel: places[index],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}

class _Search extends StatefulWidget {
  _Search({Key? key}) : super(key: key);

  @override
  __SearchState createState() => __SearchState();
}

class __SearchState extends State<_Search> {
  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              cursorColor: textColor,
              controller: _editingController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search Courses...',
                hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          _editingController.text.trim().isEmpty
              ? IconButton(
                  icon: Icon(Icons.search, color: textColor.withOpacity(0.5)),
                  onPressed: null)
              : IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.clear, color: textColor.withOpacity(0.5)),
                  onPressed: () => setState(
                    () {
                      _editingController.clear();
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index == currentPage) return;
    _currentPage = index;
    notifyListeners();
  }
}

class SearchHeader extends SliverPersistentHeaderDelegate {
  final double minTopBarHeight = 100;
  final double maxTopBarHeight = 150;
  final String title;
  final IconData icon;

  final Widget search;
  final scaffoldKey;

  SearchHeader(
      {required this.title,
      required this.icon,
      required this.search,
      required this.scaffoldKey});

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var shrinkFactor = min(1, shrinkOffset / (maxExtent - minExtent));

    var topBar = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        height:
            max(maxTopBarHeight * (1 - shrinkFactor * 1.45), minTopBarHeight),
        width: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                icon: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  _navigationService.navigateTo("/settings");
                }),
          ],
        ),
        decoration: const BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            )),
      ),
    );
    return Container(
      height: max(maxExtent - shrinkOffset, minExtent),
      child: Stack(
        fit: StackFit.loose,
        children: [
          if (shrinkFactor <= 0.5) topBar,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                alignment: Alignment.center,
                child: search,
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 10,
                        color: mainColor,
                      )
                    ]),
              ),
            ),
          ),
          if (shrinkFactor > 0.5) topBar,
        ],
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class CategorieTile extends StatefulWidget {
  final String categorie;
  final bool isSelected;
  _HomePageState context;
  CategorieTile(
      {required this.categorie,
      required this.isSelected,
      required this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
            color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white10,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          widget.categorie,
          style: TextStyle(
              color: widget.isSelected ? Color(0xffFC9535) : Color(0xffA1A1A1)),
        ),
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String speciality;
  final String imagePath;

  final int noOfDoctors;
  final Color backColor;
  CourseTile(
      {required this.speciality,
      required this.imagePath,
      required this.noOfDoctors,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 75,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.network(imagePath),
          ),
          SizedBox(height: 10),
          Text(
            speciality,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors Courses",
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
