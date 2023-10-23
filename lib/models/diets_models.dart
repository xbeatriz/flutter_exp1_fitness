import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: 'Honey Pancake',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '30mins',
      calorie: '180kCal',
      boxColor: Color(0xFF92A3FD),
      viewIsSelected: true,
    ));

    diets.add(DietModel(
      name: 'Canai Bread',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230kCal',
      boxColor: Color.fromARGB(255, 255, 124, 118),
      viewIsSelected: false,
    ));

    return diets;
  }
}
