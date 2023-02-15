import 'package:flutter/material.dart';
import 'package:interviewo/utils/constants.dart';

import '../data/Food.dart';

class FoodDetailView extends StatefulWidget {
  Food food;
  FoodDetailView({required this.food});

  @override
  _FoodDetailViewState createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FoodImage(food: widget.food),
            DetailWidget(
              food: widget.food,
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;

    /// 683
    screenHeight = _mediaQueryData!.size.height;

    /// 411
  }
}

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        height: SizeConfig.screenHeight! / 19.51,
        width: SizeConfig.screenWidth! / 10.28,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ));
  }
}

class FeaturesFood extends StatefulWidget {
  const FeaturesFood({Key? key}) : super(key: key);

  @override
  _FeaturesFoodState createState() => _FeaturesFoodState();
}

class _FeaturesFoodState extends State<FeaturesFood> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ContainerFeatures(category_text: "200+", features_text: "Calories"),
        ContainerFeatures(category_text: "%10", features_text: "Fat"),
      ],
    );
  }
}

class ContainerFeatures extends StatelessWidget {
  String category_text;
  String features_text;
  ContainerFeatures({required this.category_text, required this.features_text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight! / 13.66,

        /// 50.0
        width: SizeConfig.screenWidth! / 4.11,

        /// 100.0
        margin: EdgeInsets.only(top: SizeConfig.screenHeight! / 34.15),

        /// 20.0
        decoration: BoxDecoration(
            border: Border.all(
                color: IOTheme().IOBlue, width: SizeConfig.screenWidth! / 205.5

                /// 2.0
                ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category_text,
              style:
                  TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            Text(features_text, style: TextStyle(color: Colors.black38))
          ],
        ));
  }
}

class ReviewStars extends StatefulWidget {
  const ReviewStars({Key? key}) : super(key: key);

  @override
  _ReviewStarsState createState() => _ReviewStarsState();
}

class _ReviewStarsState extends State<ReviewStars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 45.54),

      /// 15.0
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.star_rounded,
                color: Colors.black,
              ),
              Text(
                "4.6",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenHeight! / 45.54),
              ),

              /// 15.0
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth! / 51.38),

                /// 8.0
                child: Text("(52+ Reviews)",
                    style: TextStyle(color: Colors.black26)),
              )
            ],
          ),
        ],
      )),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  const MySeparator({this.height = 1, this.color = Colors.black38});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = SizeConfig.screenWidth! / 57.71;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 34.15,
        SizeConfig.screenWidth! / 20.55,
        0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: IOTheme().IOBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            fixedSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.7, 50)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),

                /// 8.0
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                    fontSize: SizeConfig.screenHeight! / 34.15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWidget extends StatefulWidget {
  Food food;
  DetailWidget({required this.food});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.45, bottom: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 30.0, left: 10.0, right: 0.0, top: 30.0),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! / 34.15,
            ),

            /// 20.0
            FoodName(food: widget.food),
            ReviewStars(),
            FoodDescription(),
            FeaturesFood(),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    SizeConfig.screenHeight! / 34.15,
                    0,
                    0,
                  ),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              color: Colors.green.withOpacity(0.5),
                              style: BorderStyle.solid),
                          backgroundColor: IOTheme().IOGreen.withOpacity(0.7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fixedSize: Size(20, 50)),
                      child: Text("&45",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto")),
                      onPressed: () {},
                    ),
                  ),
                ),
                BuyNowButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDescription extends StatelessWidget {
  const FoodDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! / 45.54),

      /// 15.0
      child: Container(
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud eslednjn",
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

class FoodImage extends StatefulWidget {
  Food food;
  FoodImage({required this.food});

  @override
  _FoodImageState createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight! * 0.45,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        image: DecorationImage(
            image: AssetImage("${widget.food.foodImageName}"),
            fit: BoxFit.fitWidth),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! / 13.7,
              vertical: SizeConfig.screenHeight! / 34.15),

          /// 30.0 - 20.0
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ArrowBack(),
              FavoriteFood(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteFood extends StatefulWidget {
  const FavoriteFood({Key? key}) : super(key: key);

  @override
  _FavoriteFoodState createState() => _FavoriteFoodState();
}

class _FavoriteFoodState extends State<FavoriteFood> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.favorite),
      color: Colors.white,
      iconSize: SizeConfig.screenHeight! / 22.77,
    );
  }
}

class FoodName extends StatefulWidget {
  Food food;
  FoodName({required this.food});

  @override
  _FoodNameState createState() => _FoodNameState();
}

class _FoodNameState extends State<FoodName> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("${widget.food.foodName}",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: "Roboto")),

        /// 30
        SizedBox(height: 20),
        Text("Category: ${widget.food.foodCategory}",
            style: TextStyle(color: Colors.black45, fontSize: 18)),
      ]),

      /// 30
    ]);
  }
}
