import 'package:flutter/material.dart';

import 'meal_portion_button.dart';

class MealPortions extends StatelessWidget {
  const MealPortions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MealPortionButton(sizeText: "Small"),
        MealPortionButton(sizeText: "Normal"),
        MealPortionButton(sizeText: "Big")
      ],
    );
  }
}
