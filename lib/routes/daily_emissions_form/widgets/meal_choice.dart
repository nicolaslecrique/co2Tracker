import 'package:flutter/material.dart';

class MealChoice extends StatelessWidget {
  final List<String> foodList;

  const MealChoice({Key? key, required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Text>.unmodifiable(foodList.map((e) => Text(e))),
    );
  }
}
