import 'package:flutter/cupertino.dart';

class CourseModel {
  String imagePath;
  String speciality;
  int noOfDoctors;
  Color backgroundColor;
  CourseModel(
      {required this.imagePath,
      required this.speciality,
      required this.noOfDoctors,
      required this.backgroundColor});
}
