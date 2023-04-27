import 'package:flutter/cupertino.dart';

class SpecialityModel {
  String imagePath;
  String speciality;
  int noOfDoctors;
  Color backgroundColor;
  SpecialityModel(
      {required this.imagePath,
      required this.speciality,
      required this.noOfDoctors,
      required this.backgroundColor});
}
