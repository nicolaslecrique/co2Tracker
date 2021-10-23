import 'package:flutter/material.dart';

import 'meal_portion.dart';

class MealPortions extends StatelessWidget {
  const MealPortions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [MealPortion(sizeText: "Small"), MealPortion(sizeText: "Normal"), MealPortion(sizeText: "Big")],
    );
  }
}
