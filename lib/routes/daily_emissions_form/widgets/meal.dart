import 'package:co2tracker/routes/daily_emissions_form/widgets/meal_choice.dart';
import 'package:flutter/material.dart';

class Meal extends StatelessWidget {
  final String mealTitle;

  const Meal({Key? key, required this.mealTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(mealTitle),
          Row(
            children: [
              MealChoice(foodList: ['Vegetarian']),
              MealChoice(foodList: ['Pig', 'Poultry', 'Fish']),
              MealChoice(foodList: ['Beef', 'Lamb', 'Mutton'])
            ],
          )
        ],
      ),
    );
  }
}
