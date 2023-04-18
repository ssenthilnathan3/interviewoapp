import 'package:interviewo/viewmodels/BaseModel.dart';

class CommonDataModel extends BaseModel {
  final String title = "CommonData";

  void initialise() {}

  String gender = "";
  String age = "";
  String role = "";

  String instituition_name = "";
  String interests = "";

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  List<String> goalList = [
    "Qifi Wellness",
    "Qifi Mindful",
    "Qifi Yoga",
    "Qifi Nutrition",
    "Modern Yogic Lifestyle",
    "Emotional Balance",
    "Emotional Intelligence",
    "Healthy Lifestyle",
    "Spiritual Connection",
    "Daily Meditation",
    "Mental Health",
  ];
  List<String> selectedGoalList = [];

  List whenSpendList = [
    {"whenSpend": "Before Morning coffee", "value": "Before Morning coffee"},
    {"whenSpend": "After Morning coffee", "value": "After Morning coffee"},
    {"whenSpend": "After Lunch", "value": "After Lunch"},
    {"whenSpend": "Before Going to Bed", "value": "Before Going to Bed"},
    {"whenSpend": "Whenever I get time", "value": "Whenever I get time"},
  ];
  int selectedSessionIndex = -1;

  Future getAddress(country, state, city) async {
    countryValue = country;
    stateValue = state;
    cityValue = city;
    notifyListeners();
  }

  Future getInstituitionName(String name) async {
    instituition_name = name;

    notifyListeners();
  }

  Future getGoals(List<String> newGoal) async {
    selectedGoalList = newGoal;
    notifyListeners();
  }

  Future getWhenSpend(String whenSpend, newSelectedSessionIndex) async {
    selectedSessionIndex = newSelectedSessionIndex;
    whenSpend = whenSpend;
    notifyListeners();
  }

  Future saveCommonData() async {
    var joinProgramMapData = {
      'gender': gender,
      'age': age,
      'role': role,
      'instituition_name': instituition_name,
      'selectedGoalList': selectedGoalList,
      'interests': interests,
    };
    print(joinProgramMapData);
  }
}
