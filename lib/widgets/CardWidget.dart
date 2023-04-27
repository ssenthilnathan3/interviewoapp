import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interviewo/model/movie.dart';
import 'package:interviewo/model/placemodel.dart';
import 'package:interviewo/screens/tabs/detail_pages/CourseDetailPage.dart';
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
          _navigationService.navigateWithReplace('/instructor-detail');
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

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({Key? key, required this.genre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20 / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style:
            TextStyle(color: Color(0xFF12153D).withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final store;
  final double width;
  final index;
  final NavigationService _navigationService = locator<NavigationService>();

  SkillCard({
    Key? key,
    required this.store,
    required this.index,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: () {
          _navigationService.navigateTo('/videoPage');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: width,
                height: 120,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  child: Image.asset(
                    store[index].backdrop,
                    fit: BoxFit.cover,
                  ),
                )),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          store[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const IconButton(
                                icon: Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.amber,
                                ),
                                onPressed: null),
                            Text(
                              store[index].year.toString(),
                              style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [Rating(rating: 4.5)],
                          ),
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(80, 30),
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFe5e5e5)),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15), // <-- Radius
                              ),
                            ),
                            child: Text(
                              store[index].year.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
