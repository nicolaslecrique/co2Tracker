import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:flutter/material.dart';

class MealPortionButton extends StatelessWidget {
  final FoodPortion foodPortion;

  const MealPortionButton({Key? key, required this.foodPortion}) : super(key: key);

  String getPortionText(FoodPortion foodPortion) {
    switch (foodPortion) {
      case FoodPortion.small:
        return "Small";
      case FoodPortion.normal:
        return "Normal";
      case FoodPortion.big:
        return "Big";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {}, child: Text(getPortionText(foodPortion)));
  }
}
