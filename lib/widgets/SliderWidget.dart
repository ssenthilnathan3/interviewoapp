import 'package:flutter/material.dart';
import 'package:interviewo/widgets/CardWidget.dart';

class SliderWidget extends StatefulWidget {
  List? list;
  SliderWidget({Key? key, this.list}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Articles",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.list!.length, (index) {
                  var list = widget.list![index];
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          child: GenreCard(
                            genre: list[0],
                          ),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: GenreCard(genre: list[index]),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
