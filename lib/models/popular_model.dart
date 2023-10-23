// import 'package:flutter/material.dart';

class PopularDietsModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
//  Color boxColor;
  bool boxIsSelected;

  PopularDietsModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    // required this.boxColor,
    required this.boxIsSelected,
  });

  static List<PopularDietsModel> getPopularDiets() {
    List<PopularDietsModel> popularDiets = [];

    popularDiets.add(PopularDietsModel(
      name: 'Bluberry Pancake',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Medium',
      duration: '30mins',
      calorie: '230kCal',
      // boxColor: Color(0xFF92A3FD),
      boxIsSelected: true,
    ));

    popularDiets.add(PopularDietsModel(
      name: 'Salmon Nigiri',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '120kCal',
      // boxColor: Color(0xFF92A3FD),
      boxIsSelected: false,
    ));

    return popularDiets;
  }
}
