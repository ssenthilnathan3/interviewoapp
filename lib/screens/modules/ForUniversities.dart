import 'package:flutter/material.dart';

class ForUniversitiesPage extends StatefulWidget {
  const ForUniversitiesPage({Key? key}) : super(key: key);

  @override
  State<ForUniversitiesPage> createState() => _ForUniversitiesPageState();
}

class _ForUniversitiesPageState extends State<ForUniversitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage('assets/images/six.png'),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.4),
                  Colors.black.withOpacity(.2),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "",
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
                    "Learn Now",
                    style: TextStyle(
                        color: Colors.grey[900], fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
