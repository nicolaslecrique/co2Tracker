import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
import 'package:co2tracker/routes/daily_form/widgets/meal_portions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'meal_choice_button.dart';

class MealPanel extends StatelessWidget {
  final MealType mealType;

  const MealPanel({Key? key, required this.mealType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DailyFormModel>(
      builder: (BuildContext context, DailyFormModel lessonModel, Widget? child) {
        MealState meal = lessonModel.getMealState(mealType);
        return Card(
          child: Column(
            children: [
              Text(mealType.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MealChoiceButton(mealType: mealType, foodChoice: FoodChoice.Vegetarian),
                  MealChoiceButton(mealType: mealType, foodChoice: FoodChoice.PigPoultryFish),
                  MealChoiceButton(mealType: mealType, foodChoice: FoodChoice.BeefLambMutton),
                ],
              ),
              if (meal.foodChoice != FoodChoice.Vegetarian)
                MealPortions() // https://github.com/flutter/flutter/issues/3783#issuecomment-738476473
            ],
          ),
        );
      },
    );
  }
}
