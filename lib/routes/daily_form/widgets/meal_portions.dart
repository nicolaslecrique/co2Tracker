import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:flutter/material.dart';

import 'meal_portion_button.dart';

class MealPortions extends StatelessWidget {
  final MealType mealType;
  const MealPortions({Key? key, required this.mealType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MealPortionButton(mealType: mealType, foodPortion: FoodPortion.small),
        MealPortionButton(mealType: mealType, foodPortion: FoodPortion.normal),
        MealPortionButton(mealType: mealType, foodPortion: FoodPortion.big)
      ],
    );
  }
}
