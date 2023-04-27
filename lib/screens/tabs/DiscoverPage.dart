import 'package:flutter/material.dart';
import 'package:interviewo/model/movie.dart';
import 'package:interviewo/utils/constants.dart';
import 'package:interviewo/widgets/CardWidget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: IOTheme.IOBlue,
          ),
          title: Text("Discover",
              style: TextStyle(
                  color: IOTheme.IOBlue, fontWeight: FontWeight.bold)),
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return SkillCard(
                        width: MediaQuery.of(context).size.width,
                        store: movies,
                        index: index,
                      );
                    },
                    itemCount: movies.length,
                  )),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ));
  }
}
