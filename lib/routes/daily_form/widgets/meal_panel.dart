import 'package:co2tracker/routes/daily_form/model/daily_form_model.dart';
import 'package:co2tracker/routes/daily_form/model/daily_form_state.dart';
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
                  MealChoiceButton(foodList: ['Vegetarian'], isSelected: meal.foodChoice == FoodChoice.Vegetarian),
                  MealChoiceButton(
                      foodList: ['Pig', 'Poultry', 'Fish'], isSelected: meal.foodChoice == FoodChoice.PigPoultryFish),
                  MealChoiceButton(
                      foodList: ['Beef', 'Lamb', 'Mutton'], isSelected: meal.foodChoice == FoodChoice.BeefLambMutton)
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
