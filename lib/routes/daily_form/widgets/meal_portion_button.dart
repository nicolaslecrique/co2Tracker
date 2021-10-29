import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealPortionButton extends StatelessWidget {
  final MealType mealType;
  final FoodPortion foodPortion;

  const MealPortionButton({Key? key, required this.mealType, required this.foodPortion}) : super(key: key);

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
    return Consumer<DailyFormModel>(builder: (BuildContext context, DailyFormModel model, Widget? child) {
      bool isSelected = model.getMealState(mealType).foodPortionOrNull == foodPortion;
      return ElevatedButton(
          style: isSelected ? null : ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () => {model.setPortion(mealType, foodPortion)},
          child: Text(getPortionText(foodPortion)));
    });
  }
}
