import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:interviewo/data/Food.dart';
import 'package:interviewo/model/movie.dart';
import 'package:interviewo/screens/tabs/detail_pages/CourseDetailPage.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final NavigationService _navigationService = locator<NavigationService>();
  final List<String> _listItem = [
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/four.jpg',
    'assets/images/five.jpg',
  ];
  var foodList = [];
  List<String> favListItem = [];
  void getFoods() async {
    foodList = await bringTheFoods();
  }

  @override
  void initState() {
    super.initState();
    getFoods();
    // _getWishList();
  }

  _saveWishList() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setStringList('wishList', favListItem);
  }

  _getWishList() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      favListItem = _prefs.getStringList('wishList')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/one.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Lifestyle Sale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map((item) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  movie: movies[_listItem.indexOf(item)])));
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: Offset(50, -50),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: IconButton(
                                    onPressed: () {
                                      (favListItem.contains(_listItem
                                              .indexOf(item)
                                              .toString()))
                                          ? favListItem.add(_listItem
                                              .indexOf(item)
                                              .toString())
                                          : favListItem.remove(_listItem
                                              .indexOf(item)
                                              .toString());
                                      favListItem.contains(_listItem
                                              .indexOf(item)
                                              .toString())
                                          ? print("added")
                                          : print("Not added");
                                      _saveWishList();
                                    },
                                    icon: favListItem.contains(
                                            _listItem.indexOf(item).toString())
                                        ? Icon(
                                            Icons.bookmark_added,
                                            size: 15,
                                          )
                                        : Icon(
                                            Icons.bookmark_border,
                                            size: 15,
                                          )),
                              ),
                            ),
                          ),
                        )))
                    .toList(),
              )),
              SizedBox(height: 100)
            ],
          ),
        ));
  }
}
