import 'package:interviewo/model/placemodel.dart';
import 'package:interviewo/model/speciality.dart';
import 'package:flutter/cupertino.dart';

List<SpecialityModel> getSpeciality() {
  List<SpecialityModel> specialities = [];
  SpecialityModel specialityModel1 = new SpecialityModel(
      noOfDoctors: 10,
      speciality: "AR & VR",
      imagePath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2RzGeikAnS5cPgbYPavFrQmzbb6FVoTjWPw&usqp=CAU",
      backgroundColor: Color(0xffFBB97C));

  //1
  specialities.add(specialityModel1);

  SpecialityModel specialityModel2 = new SpecialityModel(
      noOfDoctors: 17,
      speciality: "Web Development",
      imagePath:
          "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20221222184908/web-development1.png",
      backgroundColor: Color(0xffF69383));

  //2

  specialities.add(specialityModel2);

  SpecialityModel specialityModel3 = new SpecialityModel(
      noOfDoctors: 17,
      speciality: "Machine Learning",
      imagePath:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF-KHSqTu4Yf42u0FPBQvR2pRO80CC_jQuvA&usqp=CAU",
      backgroundColor: Color(0xffF69383));

  specialities.add(specialityModel3);

  return specialities;
}

List<PlaceModel> getPlace() {
  List<PlaceModel> places = [];
  PlaceModel placeModel1 = PlaceModel(
      placeTitle: "Personality Development",
      locationShort: "CH",
      rateperpackage: 3000,
      rating: 3.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl:
          "https://www.techniajz.com/uploads/blog_images/215b62a87f007193fe59d13ceee33d09-0x0.png");

  //1
  places.add(placeModel1);

  PlaceModel placeModel2 = PlaceModel(
      placeTitle: "Resume Writing",
      locationShort: "CHE",
      rateperpackage: 3000,
      rating: 4.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl:
          "https://www.columbia.ab.ca/wp-content/uploads/2017/09/Resume-Writing-Course-min.png");

  //1
  places.add(placeModel2);

  PlaceModel placeModel3 = PlaceModel(
      placeTitle: "Interview Preparation Bundle",
      locationShort: "ERD",
      rateperpackage: 3000,
      rating: 4.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl:
          "https://des.az.gov/sites/default/files/media/Interview-Preparation.png");

  //1
  places.add(placeModel3);

  return places;
}
