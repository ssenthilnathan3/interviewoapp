import 'package:interviewo/model/speciality.dart';
import 'package:flutter/cupertino.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel1 = new SpecialityModel(
      noOfDoctors: 10,
      speciality: "Cough & Cold",
      imgAssetPath: "assets/img1.png",
      backgroundColor: Color(0xffFBB97C));

  //1
  specialities.add(specialityModel1);

  SpecialityModel specialityModel2 = new SpecialityModel(
      noOfDoctors: 17,
      speciality: "Heart Specialist",
      imgAssetPath: "assets/img2.png",
      backgroundColor: Color(0xffF69383));

  //2

  specialities.add(specialityModel2);

  SpecialityModel specialityModel3 = new SpecialityModel(
      noOfDoctors: 17,
      speciality: "Heart Specialist",
      imgAssetPath: "assets/img2.png",
      backgroundColor: Color(0xffF69383));

  specialities.add(specialityModel3);

  return specialities;
}
