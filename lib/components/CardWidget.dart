import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interviewo/components/Model.dart';
import 'package:interviewo/screens/DetailPage.dart';
import 'package:interviewo/services/NavigationService.dart';
import 'package:interviewo/utils/Locator.dart';

class FeaturedCard extends StatefulWidget {
  PlaceModel placeModel;

  FeaturedCard({required this.placeModel});

  @override
  _FeaturedCardState createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  late double rating;
  late String title;
  late bool favorite;

  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);

    return GestureDetector(
        onTap: () {
          _navigationService.navigateWithReplace('/details');
        },
        child: Container(
            width: size.width * 0.65,
            height: max(200, size.height * 0.32),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey.withAlpha(90)),
            child: Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image(
                      image: NetworkImage(widget.placeModel.imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 8, top: 8),
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.black.withAlpha(95)),
                    child: Column(
                      children: [
                        Container(
                          height: 28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.placeModel.placeTitle,
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Rating(rating: widget.placeModel.rating)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

Widget Rating({required double rating, Color color = Colors.white10}) {
  return Container(
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    alignment: Alignment.topLeft,
    height: 18,
    child: Row(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (rating > index && rating < index + 1)
                return Icon(Icons.star_half, color: Colors.yellow, size: 16);
              else if (index < rating)
                return Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16,
                );

              return Icon(Icons.star_border, color: Colors.yellow, size: 16);
            }),
        SizedBox(
          width: 8,
        ),
        Text(
          rating.toString(),
          style: TextStyle(
              color: color, fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
