import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interviewo/components/CardWidget.dart';
import 'package:interviewo/components/drawer/custom_drawer.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: size.height * 0.7,
              color: Colors.grey,
              child: Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Ov2ovL7F0oEK3UQDCPCVNe_7Lh6LTGLXmOPeGUm_&s"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 26, left: 20, right: 20),
                height: size.height * 0.54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mount Fuji",
                        style: TextStyle(color: Colors.lightBlue)),
                    SizedBox(height: 4),
                    Row(children: [
                      Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Honshu, Japan",
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ]),
                    SizedBox(height: 8),
                    Rating(rating: 4.5, color: Colors.black),
                    SizedBox(height: 26),
                    Text(
                      "Description",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Enjoy your winter vacation with warmth and amazing sightseeing on the mountains. Enjoy the best experience with us!",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "\$400",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "/Package",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))
                          ]),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                elevation: 0,
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'PlayFair',
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Book Now",
                                style: TextStyle(color: Colors.black),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
