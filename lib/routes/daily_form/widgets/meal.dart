import 'package:flutter/material.dart';

import 'meal_choice.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MealChoice(foodList: ['Vegetarian']),
              MealChoice(foodList: ['Pig', 'Poultry', 'Fish']),
              MealChoice(foodList: ['Beef', 'Lamb', 'Mutton'])
            ],
          ),
        ],
      ),
    );
  }
}
