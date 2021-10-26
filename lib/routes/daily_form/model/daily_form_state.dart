import 'package:flutter/material.dart';

enum FoodChoice {
  Vegetarian,
  PigPoultryFish,
  BeefLambMutton,
}

enum FoodPortion { small, normal, big }

@immutable
class MealState {
  final FoodChoice foodChoice;
  final FoodPortion? foodPortionOrNull; // null if foodChoice is Vegetarian

  const MealState(this.foodChoice, this.foodPortionOrNull);
}

@immutable
class DailyFormState {
  final MealState breakfast;
  final MealState lunch;
  final MealState dinner;

  const DailyFormState(this.breakfast, this.lunch, this.dinner);

  factory DailyFormState.defaultDay() {
    return DailyFormState(MealState(FoodChoice.Vegetarian, null), MealState(FoodChoice.Vegetarian, null),
        MealState(FoodChoice.Vegetarian, null));
  }
}
