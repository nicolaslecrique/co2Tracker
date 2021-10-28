import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:flutter/material.dart';

import 'meal_portion_button.dart';

class MealPortions extends StatelessWidget {
  const MealPortions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MealPortionButton(foodPortion: FoodPortion.small),
        MealPortionButton(foodPortion: FoodPortion.normal),
        MealPortionButton(foodPortion: FoodPortion.big)
      ],
    );
  }
}
