import 'package:interviewo/components/Model.dart';
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

List<PlaceModel> getPlace() {
  List<PlaceModel> places = [];
  PlaceModel placeModel1 = PlaceModel(
      placeTitle: "Chandigar",
      locationShort: "CH",
      rateperpackage: 3000,
      rating: 3.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl: "https://www.holidify.com/images/bgImages/CHANDIGARH.jpg");

  //1
  places.add(placeModel1);

  PlaceModel placeModel2 = PlaceModel(
      placeTitle: "Chennai",
      locationShort: "CHE",
      rateperpackage: 3000,
      rating: 4.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl:
          "https://media.istockphoto.com/id/1226340114/photo/puratchi-thalaivar-dr-mgr-central-railway-station-chennai-central-railway-station-india.jpg?s=612x612&w=0&k=20&c=lZjBnWBBoLiApWZUUWP1Vl3XAVdKjYMcgGpItXv_L14=");

  //1
  places.add(placeModel2);

  PlaceModel placeModel3 = PlaceModel(
      placeTitle: "Erode",
      locationShort: "ERD",
      rateperpackage: 3000,
      rating: 4.5,
      description: "This is a short description",
      duration: 1000,
      imgUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0Ov2ovL7F0oEK3UQDCPCVNe_7Lh6LTGLXmOPeGUm_&s");

  //1
  places.add(placeModel3);

  return places;
}
