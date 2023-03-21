import 'package:flutter/material.dart';
import 'package:interviewo/model/movie.dart';
import 'package:interviewo/widgets/CardWidget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () {},
              child: SkillCard(
                width: MediaQuery.of(context).size.width,
                store: movies,
                index: index,
              ),
            );
          },
          itemCount: movies.length,
        )));
  }
}
